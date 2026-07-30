import { useEffect, useMemo, useState } from 'react'
import {
  MriButton,
  MriCard,
  MriInput,
  MriKbd,
  MriPageHeader,
  MriScrollArea,
  MriSearchInput,
  MriSpinner,
} from '@mriqbox/ui-kit'
import { Smile } from 'lucide-react'
import { fetchNui } from '@/nui/fetchNui'
import type { EmoteEntry, MenuPayload, SlotId, SlotMap } from '@/types'
import { SLOT_GLYPH, SLOT_LABEL, SLOT_ORDER } from '@/types'

interface Props {
  onClose?: () => void
}

/**
 * Tela de administração: define o emote padrão de cada atalho de seta para o
 * servidor inteiro. O override de cada player sempre vence este valor — quem já
 * personalizou não é afetado por uma mudança aqui.
 *
 * A autorização real acontece no servidor (server/players.lua ->
 * HasEmotePerms); o `isAdmin` daqui é só para não mostrar botão inútil.
 */
export function AdminDefaults({ onClose }: Props) {
  const [payload, setPayload] = useState<MenuPayload | null>(null)
  const [drafts, setDrafts] = useState<Record<string, { emote: string; label: string }>>({})
  const [search, setSearch] = useState('')
  const [active, setActive] = useState<SlotId>('UP')
  const [busy, setBusy] = useState<string | null>(null)
  const [feedback, setFeedback] = useState<string | null>(null)

  useEffect(() => {
    void (async () => {
      const data = await fetchNui<MenuPayload>('getCatalog')
      if (!data) return
      setPayload(data)
      setDrafts(seedDrafts(data.slots))
    })()
  }, [])

  const results = useMemo(() => {
    if (!payload) return []
    const term = search.trim().toLowerCase()
    const usable = payload.catalog.filter(
      (e: EmoteEntry) => e.category !== 'Walks' && e.category !== 'Expressions',
    )
    if (!term) return usable.slice(0, 100)
    return usable
      .filter((e) => e.label.toLowerCase().includes(term) || e.name.toLowerCase().includes(term))
      .slice(0, 100)
  }, [payload, search])

  if (!payload) {
    return (
      <div className="flex h-full items-center justify-center">
        <MriSpinner />
      </div>
    )
  }

  if (!payload.isAdmin) {
    return (
      <div className="flex h-full items-center justify-center p-8">
        <p className="text-sm text-muted-foreground">
          Você não tem permissão para alterar os padrões de emote do servidor.
        </p>
      </div>
    )
  }

  const draft = drafts[active] ?? { emote: '', label: '' }

  const save = async () => {
    setBusy(active)
    setFeedback(null)

    const res = await fetchNui<{ ok: boolean; error?: string }>('adminSetDefault', {
      slot: active,
      emote: draft.emote,
      label: draft.label.trim() || undefined,
    })

    setBusy(null)
    setFeedback(res?.ok ? 'Padrão do servidor atualizado.' : (res?.error ?? 'Falha ao salvar.'))

    if (res?.ok) {
      const fresh = await fetchNui<MenuPayload>('getCatalog')
      if (fresh) setPayload(fresh)
    }
  }

  return (
    <div className="flex h-full flex-col gap-4 p-5">
      <MriPageHeader title="Emotes — padrões dos atalhos" icon={Smile} />

      <p className="text-xs text-muted-foreground">
        Define o emote padrão de cada seta para todo o servidor. Quem já personalizou o próprio
        atalho continua com a escolha dele — o override do player sempre vence.
      </p>

      <div className="grid min-h-0 flex-1 grid-cols-[220px_1fr] gap-4">
        <div className="flex flex-col gap-2">
          {SLOT_ORDER.map((slot) => {
            const current = payload.slots[slot]
            return (
              <button
                key={slot}
                type="button"
                onClick={() => setActive(slot)}
                className={`flex items-center gap-3 rounded-lg border px-3 py-2 text-left transition-colors ${
                  active === slot
                    ? 'border-primary/60 bg-primary/10'
                    : 'border-border bg-card/60 hover:bg-card'
                }`}
              >
                <MriKbd className="w-7 shrink-0 text-center">{SLOT_GLYPH[slot]}</MriKbd>
                <span className="min-w-0">
                  <span className="block truncate text-sm text-foreground">{SLOT_LABEL[slot]}</span>
                  <span className="block truncate text-[11px] text-muted-foreground">
                    {current ? `/e ${current.emote}` : '—'}
                  </span>
                </span>
              </button>
            )
          })}
        </div>

        <MriCard className="flex min-h-0 flex-col gap-3 p-4">
          <div>
            <label className="mb-1 block text-xs font-medium text-muted-foreground">
              Nome padrão do atalho (opcional)
            </label>
            <MriInput
              value={draft.label}
              maxLength={64}
              placeholder="Ex.: Cumprimentar"
              onChange={(e) =>
                setDrafts((prev) => ({
                  ...prev,
                  [active]: { ...draft, label: e.target.value },
                }))
              }
            />
          </div>

          <div className="flex min-h-0 flex-1 flex-col">
            <label className="mb-1 block text-xs font-medium text-muted-foreground">
              Emote {draft.emote ? `— selecionado: ${draft.emote}` : ''}
            </label>
            <MriSearchInput value={search} onChange={setSearch} placeholder="Buscar emote..." />

            <MriScrollArea className="mt-2 min-h-0 flex-1 rounded-lg border border-border">
              <div className="p-1">
                {results.map((entry) => (
                  <button
                    key={entry.name}
                    type="button"
                    onClick={() =>
                      setDrafts((prev) => ({
                        ...prev,
                        [active]: { ...draft, emote: entry.name },
                      }))
                    }
                    className={`flex w-full items-center justify-between rounded-md px-3 py-1.5 text-left text-sm transition-colors ${
                      draft.emote === entry.name
                        ? 'bg-primary/15 text-primary'
                        : 'text-foreground hover:bg-muted'
                    }`}
                  >
                    <span className="truncate">{entry.label}</span>
                    <span className="ml-3 shrink-0 text-[11px] text-muted-foreground">
                      /e {entry.name}
                    </span>
                  </button>
                ))}
              </div>
            </MriScrollArea>
          </div>

          <div className="flex items-center justify-between gap-3">
            <span className="text-xs text-muted-foreground">{feedback}</span>
            <div className="flex gap-2">
              {onClose && (
                <MriButton variant="ghost" size="sm" onClick={onClose}>
                  Fechar
                </MriButton>
              )}
              <MriButton size="sm" disabled={!draft.emote || busy === active} onClick={() => void save()}>
                Salvar padrão
              </MriButton>
            </div>
          </div>
        </MriCard>
      </div>
    </div>
  )
}

function seedDrafts(slots: SlotMap) {
  const out: Record<string, { emote: string; label: string }> = {}
  for (const slot of SLOT_ORDER) {
    out[slot] = { emote: slots[slot]?.emote ?? '', label: slots[slot]?.label ?? '' }
  }
  return out
}

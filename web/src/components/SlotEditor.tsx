import { useMemo, useState } from 'react'
import { MriButton, MriInput, MriKbd, MriModal, MriScrollArea, MriSearchInput } from '@mriqbox/ui-kit'
import { AlertTriangle, RotateCcw } from 'lucide-react'
import type { EmoteEntry, NicknameMap, SlotId, SlotMap } from '@/types'
import { SLOT_GLYPH, SLOT_LABEL, displayName } from '@/types'

interface Props {
  slot: SlotId
  slots: SlotMap
  catalog: EmoteEntry[]
  nicknames: NicknameMap
  onSave: (slot: SlotId, emote?: string, label?: string) => Promise<boolean> | boolean
  onClose: () => void
}

/**
 * Editor de um atalho de seta: escolhe o emote pela lista e, opcionalmente, dá
 * um nome próprio ao atalho. Salvar sem nome mantém o label do emote; o botão
 * "voltar ao padrão" limpa o override e devolve o slot ao default do servidor.
 */
export function SlotEditor({ slot, slots, catalog, nicknames, onSave, onClose }: Props) {
  const current = slots[slot]
  const [emote, setEmote] = useState<string>(current?.emote ?? '')
  const [label, setLabel] = useState<string>(current?.label ?? '')
  const [search, setSearch] = useState('')
  const [busy, setBusy] = useState(false)

  const results = useMemo(() => {
    const term = search.trim().toLowerCase()
    // Walks e Expressions não fazem sentido como atalho de emote.
    const usable = catalog.filter((e) => e.category !== 'Walks' && e.category !== 'Expressions')
    if (!term) return usable.slice(0, 120)
    return usable
      .filter(
        (e) =>
          e.label.toLowerCase().includes(term) ||
          e.name.toLowerCase().includes(term) ||
          (nicknames[e.name] ?? '').toLowerCase().includes(term),
      )
      .slice(0, 120)
  }, [catalog, nicknames, search])

  const save = async (nextEmote?: string, nextLabel?: string) => {
    setBusy(true)
    const ok = await onSave(slot, nextEmote, nextLabel)
    setBusy(false)
    if (ok) onClose()
  }

  return (
    <MriModal onClose={onClose} hideBlur className="w-[560px] max-w-[92vw]">
      <div className="flex flex-col gap-4 p-5">
        <div className="flex items-center gap-3">
          <MriKbd className="w-8 text-center text-base">{SLOT_GLYPH[slot]}</MriKbd>
          <div>
            <h2 className="text-base font-semibold text-foreground">{SLOT_LABEL[slot]}</h2>
            <p className="text-xs text-muted-foreground">
              Escolha o emote e, se quiser, dê um nome próprio a este atalho.
            </p>
          </div>
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-muted-foreground">
            Nome do atalho (opcional)
          </label>
          <MriInput
            value={label}
            onChange={(e) => setLabel(e.target.value)}
            placeholder="Ex.: Cumprimentar"
            maxLength={64}
          />
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-muted-foreground">Emote</label>
          <MriSearchInput value={search} onChange={setSearch} placeholder="Buscar emote..." />

          <MriScrollArea className="mt-2 h-56 rounded-lg border border-border">
            <div className="p-1">
              {results.length === 0 && (
                <p className="p-4 text-center text-xs text-muted-foreground">
                  Nenhum emote encontrado.
                </p>
              )}
              {results.map((entry) => (
                <button
                  key={entry.name}
                  type="button"
                  onClick={() => setEmote(entry.name)}
                  className={`flex w-full items-center justify-between rounded-md px-3 py-1.5 text-left text-sm transition-colors ${
                    emote === entry.name
                      ? 'bg-primary/15 text-primary'
                      : 'text-foreground hover:bg-muted'
                  }`}
                >
                  <span className="flex min-w-0 items-center gap-1.5">
                    {entry.missing && (
                      <span
                        className="shrink-0"
                        title="Este emote não está disponível neste cliente."
                        aria-label="indisponível"
                      >
                        <AlertTriangle className="h-3 w-3 text-destructive" />
                      </span>
                    )}
                    <span className="truncate">{displayName(entry, nicknames)}</span>
                  </span>
                  <span className="ml-3 shrink-0 text-[11px] text-muted-foreground">
                    /e {entry.name}
                  </span>
                </button>
              ))}
            </div>
          </MriScrollArea>
        </div>

        <div className="flex items-center justify-between gap-2">
          <MriButton
            variant="ghost"
            size="sm"
            disabled={busy || current?.source !== 'player'}
            onClick={() => void save(undefined, undefined)}
            title="Remove seu ajuste e volta ao padrão do servidor"
          >
            <RotateCcw className="mr-2 h-3.5 w-3.5" />
            Voltar ao padrão
          </MriButton>

          <div className="flex gap-2">
            <MriButton variant="ghost" size="sm" onClick={onClose} disabled={busy}>
              Cancelar
            </MriButton>
            <MriButton
              size="sm"
              disabled={busy || !emote}
              onClick={() => void save(emote, label.trim() || undefined)}
            >
              Salvar
            </MriButton>
          </div>
        </div>
      </div>
    </MriModal>
  )
}

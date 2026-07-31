import { MriKbd } from '@mriqbox/ui-kit'
import { Pencil } from 'lucide-react'
import type { EmoteEntry, NicknameMap, SlotId, SlotMap } from '@/types'
import { SLOT_GLYPH, SLOT_LABEL, SLOT_ORDER } from '@/types'

interface Props {
  slots: SlotMap
  catalog: EmoteEntry[]
  nicknames: NicknameMap
  onEdit: (slot: SlotId) => void
}

/** Nome exibido: rótulo custom > label do emote > nome cru. */
export function slotDisplayName(
  slot: SlotId,
  slots: SlotMap,
  catalog: EmoteEntry[],
  nicknames: NicknameMap = {},
): string {
  const current = slots[slot]
  if (!current) return '—'
  // Rótulo custom do atalho vence; depois o apelido pessoal do emote.
  if (current.label) return current.label
  if (nicknames[current.emote]) return nicknames[current.emote]
  return catalog.find((e) => e.name === current.emote)?.label ?? current.emote
}

export function SlotBar({ slots, catalog, nicknames, onEdit }: Props) {
  return (
    <div className="flex flex-col gap-2">
      <div className="flex items-baseline justify-between">
        <h3 className="text-sm font-semibold text-foreground">Atalhos</h3>
        <span className="text-[11px] text-muted-foreground">as setas do teclado</span>
      </div>

      {SLOT_ORDER.map((slot) => {
        const current = slots[slot]
        return (
          <button
            key={slot}
            type="button"
            onClick={() => onEdit(slot)}
            title={`Editar ${SLOT_LABEL[slot]}`}
            className="group flex items-center gap-3 rounded-lg border border-border bg-card/60 px-3 py-2 text-left transition-colors hover:border-primary/50 hover:bg-card"
          >
            <MriKbd className="w-7 shrink-0 text-center">{SLOT_GLYPH[slot]}</MriKbd>

            <span className="min-w-0 flex-1">
              <span className="block truncate text-sm text-foreground">
                {slotDisplayName(slot, slots, catalog, nicknames)}
              </span>
              <span className="block truncate text-[11px] text-muted-foreground">
                {current
                  ? `/e ${current.emote}${current.source === 'player' ? ' · seu' : ''}`
                  : 'sem atalho'}
              </span>
            </span>

            <Pencil className="h-3.5 w-3.5 shrink-0 text-muted-foreground opacity-0 transition-opacity group-hover:opacity-100" />
          </button>
        )
      })}
    </div>
  )
}

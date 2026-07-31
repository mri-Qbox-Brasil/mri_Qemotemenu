import { useEffect, useMemo, useState } from 'react'
import { MriButton } from '@mriqbox/ui-kit'
import { X } from 'lucide-react'
import type { EmoteEntry, NicknameMap, Wheel } from '@/types'
import { displayName } from '@/types'

interface Props {
  /** Emote que está sendo equipado. */
  entry: EmoteEntry
  wheel: Wheel
  slots: number
  catalog: EmoteEntry[]
  nicknames: NicknameMap
  onPick: (slot: number, emote?: string) => Promise<boolean> | boolean
  onClose: () => void
}

const SIZE = 340
const CENTER = SIZE / 2
const R_OUT = 160
const R_IN = 64
const GAP = 1.6 // graus de respiro entre setores

const polar = (angleDeg: number, radius: number) => {
  const rad = ((angleDeg - 90) * Math.PI) / 180
  return { x: CENTER + radius * Math.cos(rad), y: CENTER + radius * Math.sin(rad) }
}

/** Setor de anel (donut) entre dois ângulos. */
function sectorPath(from: number, to: number) {
  const a1 = from + GAP
  const a2 = to - GAP
  const large = a2 - a1 > 180 ? 1 : 0

  const o1 = polar(a1, R_OUT)
  const o2 = polar(a2, R_OUT)
  const i2 = polar(a2, R_IN)
  const i1 = polar(a1, R_IN)

  return [
    `M ${o1.x} ${o1.y}`,
    `A ${R_OUT} ${R_OUT} 0 ${large} 1 ${o2.x} ${o2.y}`,
    `L ${i2.x} ${i2.y}`,
    `A ${R_IN} ${R_IN} 0 ${large} 0 ${i1.x} ${i1.y}`,
    'Z',
  ].join(' ')
}

/**
 * Seletor de slot da roda de emotes.
 *
 * É um componente nosso, não a roda do ox_lib: a NUI dela é `ui_page` do próprio
 * ox_lib, não dá para abrir de fora nem embutir aqui. Aqui só se equipa — quem
 * executa é a roda de verdade, no F1.
 */
export function WheelPicker({
  entry,
  wheel,
  slots,
  catalog,
  nicknames,
  onPick,
  onClose,
}: Props) {
  const [hovered, setHovered] = useState<number | null>(null)
  const [busy, setBusy] = useState(false)

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        e.stopPropagation()
        onClose()
      }
    }
    window.addEventListener('keydown', onKey, true)
    return () => window.removeEventListener('keydown', onKey, true)
  }, [onClose])

  const byName = useMemo(() => {
    const map = new Map<string, EmoteEntry>()
    for (const e of catalog) map.set(e.name, e)
    return map
  }, [catalog])

  const nameOf = (emote: string | false) => {
    if (!emote) return null
    const found = byName.get(emote)
    return found ? displayName(found, nicknames) : emote
  }

  const pick = async (slot: number) => {
    if (busy) return
    setBusy(true)
    // Clicar no slot que já tem este emote esvazia — é o caminho para remover
    // sem precisar de um segundo botão.
    const alreadyHere = wheel[slot - 1] === entry.name
    const ok = await onPick(slot, alreadyHere ? undefined : entry.name)
    setBusy(false)
    if (ok) onClose()
  }

  const step = 360 / slots

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/55"
      onClick={onClose}
    >
      <div
        className="flex flex-col items-center gap-3 rounded-2xl border border-border bg-card/95 p-6 shadow-2xl"
        onClick={(e) => e.stopPropagation()}
      >
        <header className="text-center">
          <h2 className="text-base font-semibold text-foreground">Colocar na roda</h2>
          <p className="text-xs text-muted-foreground">
            Escolha o slot para <span className="text-primary">{displayName(entry, nicknames)}</span>
          </p>
        </header>

        <svg width={SIZE} height={SIZE} viewBox={`0 0 ${SIZE} ${SIZE}`}>
          {Array.from({ length: slots }, (_, i) => {
            const slot = i + 1
            const from = i * step
            const to = from + step
            const equipped = wheel[i] ?? false
            const isThis = equipped === entry.name
            const isHovered = hovered === slot
            const mid = polar(from + step / 2, (R_IN + R_OUT) / 2)

            return (
              <g
                key={slot}
                onMouseEnter={() => setHovered(slot)}
                onMouseLeave={() => setHovered(null)}
                onClick={() => void pick(slot)}
                style={{ cursor: 'pointer' }}
              >
                <path
                  d={sectorPath(from, to)}
                  className={
                    isThis
                      ? 'fill-primary/30 stroke-primary'
                      : isHovered
                        ? 'fill-primary/15 stroke-primary/70'
                        : 'fill-muted/60 stroke-border'
                  }
                  strokeWidth={1.5}
                />
                <text
                  x={mid.x}
                  y={mid.y - 6}
                  textAnchor="middle"
                  className="fill-muted-foreground text-[10px]"
                >
                  slot {slot}
                </text>
                <text
                  x={mid.x}
                  y={mid.y + 8}
                  textAnchor="middle"
                  className={`text-[11px] ${equipped ? 'fill-foreground' : 'fill-muted-foreground/60'}`}
                >
                  {truncate(nameOf(equipped) ?? 'vazio', 14)}
                </text>
              </g>
            )
          })}

          <circle cx={CENTER} cy={CENTER} r={R_IN - 6} className="fill-background stroke-border" />
          <text
            x={CENTER}
            y={CENTER - 2}
            textAnchor="middle"
            className="fill-muted-foreground text-[10px]"
          >
            F1 no jogo
          </text>
          <text
            x={CENTER}
            y={CENTER + 12}
            textAnchor="middle"
            className="fill-muted-foreground/70 text-[9px]"
          >
            para usar
          </text>
        </svg>

        <p className="max-w-[300px] text-center text-[11px] text-muted-foreground">
          {hovered && wheel[hovered - 1] === entry.name
            ? 'Clique para tirar da roda.'
            : 'Clicar num slot ocupado substitui o que está lá.'}
        </p>

        <MriButton variant="ghost" size="sm" onClick={onClose}>
          <X className="mr-1.5 h-4 w-4" />
          Fechar
        </MriButton>
      </div>
    </div>
  )
}

function truncate(text: string, max: number) {
  return text.length > max ? `${text.slice(0, max - 1)}…` : text
}

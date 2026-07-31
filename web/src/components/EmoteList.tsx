import { useEffect, useRef, useState } from 'react'
import { MriScrollArea } from '@mriqbox/ui-kit'
import { Check, Package, Pencil, Plus, Star, AlertTriangle, Users } from 'lucide-react'
import type { EmoteEntry, NicknameMap, Wheel } from '@/types'
import { displayName } from '@/types'

interface Props {
  entries: EmoteEntry[]
  favorites: string[]
  nicknames: NicknameMap
  wheel: Wheel
  selected: string | null
  onPlay: (entry: EmoteEntry) => void
  onPreview: (entry: EmoteEntry | null) => void
  onToggleFavorite: (name: string) => void
  onRename: (name: string, nickname: string) => void
  onEquip: (entry: EmoteEntry) => void
}

const MISSING_REASON: Record<string, string> = {
  anim: 'A animação deste emote não existe neste cliente — o arquivo não está no servidor ou o gamebuild é antigo.',
  prop: 'O objeto (prop) deste emote não existe neste cliente.',
}

export function EmoteList({
  entries,
  favorites,
  nicknames,
  wheel,
  selected,
  onPlay,
  onPreview,
  onToggleFavorite,
  onRename,
  onEquip,
}: Props) {
  const [editing, setEditing] = useState<string | null>(null)
  const [draft, setDraft] = useState('')
  const inputRef = useRef<HTMLInputElement>(null)

  useEffect(() => {
    if (editing) inputRef.current?.focus()
  }, [editing])

  const startRename = (entry: EmoteEntry) => {
    setEditing(entry.name)
    setDraft(nicknames[entry.name] ?? entry.label)
  }

  const commitRename = (name: string) => {
    onRename(name, draft.trim())
    setEditing(null)
  }

  if (entries.length === 0) {
    return (
      <div className="flex h-full items-center justify-center">
        <p className="text-sm text-muted-foreground">Nenhum emote encontrado.</p>
      </div>
    )
  }

  return (
    <MriScrollArea className="h-full">
      <div className="flex flex-col p-1 pr-3">
        {entries.map((entry) => {
          const isFavorite = favorites.includes(entry.name)
          const isSelected = selected === entry.name
          const isEquipped = wheel.includes(entry.name)
          const isEditing = editing === entry.name

          return (
            <div
              key={`${entry.category}:${entry.name}`}
              onMouseEnter={() => !isEditing && onPreview(entry)}
              // Borda-guia à esquerda: o item sob o cursor é o que está sendo
              // executado no ped, então a relação precisa ser óbvia.
              className={`group flex items-center gap-2 rounded-md border-l-2 py-1 pl-2 pr-1 transition-colors ${
                isSelected
                  ? 'border-primary bg-primary/12'
                  : 'border-transparent hover:border-primary/50 hover:bg-muted/70'
              }`}
            >
              {entry.missing && (
                // O title vai no span: LucideProps desta versão não aceita title.
                <span
                  className="shrink-0"
                  title={MISSING_REASON[entry.missing] ?? 'Emote indisponível.'}
                  aria-label="indisponível"
                >
                  <AlertTriangle className="h-3.5 w-3.5 text-destructive" />
                </span>
              )}

              {isEditing ? (
                <input
                  ref={inputRef}
                  value={draft}
                  maxLength={48}
                  onChange={(e) => setDraft(e.target.value)}
                  onBlur={() => commitRename(entry.name)}
                  onKeyDown={(e) => {
                    if (e.key === 'Enter') commitRename(entry.name)
                    if (e.key === 'Escape') setEditing(null)
                    // Não deixa o ESC do input fechar o menu inteiro.
                    e.stopPropagation()
                  }}
                  className="min-w-0 flex-1 rounded bg-input px-1.5 py-0.5 text-sm text-foreground outline-none ring-1 ring-primary/60"
                  placeholder="Vazio volta ao nome original"
                />
              ) : (
                <button
                  type="button"
                  onClick={() => onPlay(entry)}
                  className="flex min-w-0 flex-1 items-center gap-1.5 text-left"
                >
                  <span
                    className={`truncate text-sm ${
                      entry.missing ? 'text-muted-foreground line-through' : 'text-foreground'
                    }`}
                  >
                    {displayName(entry, nicknames)}
                  </span>
                  {entry.prop && <Package className="h-3 w-3 shrink-0 text-muted-foreground" />}
                  {entry.shared && <Users className="h-3 w-3 shrink-0 text-muted-foreground" />}
                  {nicknames[entry.name] && (
                    <span className="shrink-0 text-[10px] text-muted-foreground/70">
                      ({entry.label})
                    </span>
                  )}
                </button>
              )}

              <span className="shrink-0 text-[11px] text-muted-foreground">/e {entry.name}</span>

              {!isEditing && (
                <div className="flex shrink-0 items-center">
                  <RowAction
                    icon={Pencil}
                    title="Renomear (só para você)"
                    onClick={() => startRename(entry)}
                  />
                  <RowAction
                    icon={isEquipped ? Check : Plus}
                    title={isEquipped ? 'Já está na roda — clique para trocar de slot' : 'Colocar na roda de emotes'}
                    active={isEquipped}
                    onClick={() => onEquip(entry)}
                  />
                  <RowAction
                    icon={Star}
                    title={isFavorite ? 'Remover dos favoritos' : 'Adicionar aos favoritos'}
                    active={isFavorite}
                    filled={isFavorite}
                    onClick={() => onToggleFavorite(entry.name)}
                  />
                </div>
              )}
            </div>
          )
        })}
      </div>
    </MriScrollArea>
  )
}

function RowAction({
  icon: Icon,
  title,
  onClick,
  active,
  filled,
}: {
  icon: typeof Star
  title: string
  onClick: () => void
  active?: boolean
  filled?: boolean
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      title={title}
      // Some quando o cursor não está na linha, para a lista respirar. O que
      // está ativo (favorito/equipado) continua visível.
      className={`rounded p-1 transition-all ${
        active
          ? 'text-primary'
          : 'text-muted-foreground opacity-0 hover:text-foreground group-hover:opacity-100'
      }`}
    >
      <Icon className="h-3.5 w-3.5" fill={filled ? 'currentColor' : 'none'} />
    </button>
  )
}

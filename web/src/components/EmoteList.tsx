import { MriBadge, MriScrollArea } from '@mriqbox/ui-kit'
import { Package, Star, Users } from 'lucide-react'
import type { EmoteEntry } from '@/types'

interface Props {
  entries: EmoteEntry[]
  favorites: string[]
  selected: string | null
  onPlay: (entry: EmoteEntry) => void
  onPreview: (entry: EmoteEntry | null) => void
  onToggleFavorite: (name: string) => void
}

export function EmoteList({
  entries,
  favorites,
  selected,
  onPlay,
  onPreview,
  onToggleFavorite,
}: Props) {
  if (entries.length === 0) {
    return (
      <div className="flex h-full items-center justify-center">
        <p className="text-sm text-muted-foreground">Nenhum emote encontrado.</p>
      </div>
    )
  }

  return (
    <MriScrollArea className="h-full">
      <div className="flex flex-col gap-0.5 p-1 pr-3">
        {entries.map((entry) => {
          const isFavorite = favorites.includes(entry.name)
          const isSelected = selected === entry.name

          return (
            <div
              key={`${entry.category}:${entry.name}`}
              onMouseEnter={() => onPreview(entry)}
              className={`group flex items-center gap-2 rounded-lg px-3 py-2 transition-colors ${
                isSelected ? 'bg-primary/12' : 'hover:bg-muted/60'
              }`}
            >
              <button
                type="button"
                onClick={() => onPlay(entry)}
                className="min-w-0 flex-1 text-left"
              >
                <span className="flex items-center gap-1.5">
                  <span className="truncate text-sm text-foreground">{entry.label}</span>
                  {entry.prop && (
                    <Package className="h-3 w-3 shrink-0 text-muted-foreground" aria-label="tem prop" />
                  )}
                  {entry.shared && (
                    <Users className="h-3 w-3 shrink-0 text-muted-foreground" aria-label="em dupla" />
                  )}
                </span>
                <span className="block truncate text-[11px] text-muted-foreground">
                  /e {entry.name}
                </span>
              </button>

              {entry.variations ? (
                <MriBadge variant="secondary" className="shrink-0 text-[10px]">
                  {entry.variations} cores
                </MriBadge>
              ) : null}

              <button
                type="button"
                onClick={() => onToggleFavorite(entry.name)}
                title={isFavorite ? 'Remover dos favoritos' : 'Adicionar aos favoritos'}
                className={`shrink-0 rounded-md p-1.5 transition-all ${
                  isFavorite
                    ? 'text-primary'
                    : 'text-muted-foreground opacity-0 group-hover:opacity-100 hover:text-foreground'
                }`}
              >
                <Star className="h-3.5 w-3.5" fill={isFavorite ? 'currentColor' : 'none'} />
              </button>
            </div>
          )
        })}
      </div>
    </MriScrollArea>
  )
}

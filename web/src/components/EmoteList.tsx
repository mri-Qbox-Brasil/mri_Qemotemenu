import { useEffect, useLayoutEffect, useRef, useState } from 'react'
import { AlertTriangle, Check, Package, Pencil, Plus, Star, Users } from 'lucide-react'
import type { EmoteEntry, NicknameMap, Wheel } from '@/types'
import { displayName } from '@/types'

interface Props {
  entries: EmoteEntry[]
  /** Muda quando a lista trocou de conteúdo (aba/busca) e a rolagem deve voltar ao topo. */
  resetKey: string
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

/**
 * Altura fixa de cada linha, em px. É o que permite a virtualização abaixo
 * calcular a janela sem medir nada — mudar aqui exige mudar o `h-[30px]` da
 * linha junto, senão o cálculo desalinha do que está desenhado.
 */
const ROW_H = 30
const OVERSCAN = 8

export function EmoteList({
  entries,
  resetKey,
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

  // ---------------------------------------------------------------
  // Virtualização
  // ---------------------------------------------------------------
  // O catálogo tem ~3.800 emotes e uma aba sozinha passa de 800. Desenhar tudo
  // de uma vez são milhares de nós no CEF, e a rolagem engasga. Aqui só as
  // linhas visíveis (mais uma folga) existem no DOM; o resto é altura reservada.
  const viewportRef = useRef<HTMLDivElement>(null)
  const [scrollTop, setScrollTop] = useState(0)
  const [viewportH, setViewportH] = useState(0)

  useLayoutEffect(() => {
    const el = viewportRef.current
    if (!el) return

    const measure = () => setViewportH(el.clientHeight)
    measure()

    const observer = new ResizeObserver(measure)
    observer.observe(el)
    return () => observer.disconnect()
  }, [])

  // Trocar de aba ou buscar muda a lista inteira: sem voltar ao topo, o usuário
  // fica olhando para um vazio no meio de uma lista curta.
  //
  // O gatilho é `resetKey` (categoria + busca), e não a identidade de `entries`:
  // favoritar ou renomear também gera um array novo, e voltar ao topo nessas
  // horas tira o usuário de onde ele estava — justamente na linha em que acabou
  // de clicar.
  useEffect(() => {
    viewportRef.current?.scrollTo({ top: 0 })
    setScrollTop(0)
  }, [resetKey])

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

  const start = Math.max(0, Math.floor(scrollTop / ROW_H) - OVERSCAN)
  const end = Math.min(entries.length, Math.ceil((scrollTop + viewportH) / ROW_H) + OVERSCAN)
  const window = entries.slice(start, end)

  return (
    <div
      ref={viewportRef}
      onScroll={(e) => setScrollTop(e.currentTarget.scrollTop)}
      className="h-full overflow-y-auto overflow-x-hidden p-1 pr-2"
    >
      <div style={{ height: entries.length * ROW_H }}>
        <div style={{ transform: `translateY(${start * ROW_H}px)` }}>
          {window.map((entry) => {
            const isFavorite = favorites.includes(entry.name)
            const isSelected = selected === entry.name
            const isEquipped = wheel.includes(entry.name)
            const isEditing = editing === entry.name

            return (
              <div
                key={`${entry.category}:${entry.name}`}
                onMouseEnter={() => !isEditing && onPreview(entry)}
                style={{ height: ROW_H }}
                // Borda-guia à esquerda: o item sob o cursor é o que está sendo
                // executado no ped, então a relação precisa ser óbvia.
                className={`group flex items-center gap-2 rounded-md border-l-2 pl-2 pr-1 transition-colors ${
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
                      title={
                        isEquipped
                          ? 'Já está na roda — clique para trocar de slot'
                          : 'Colocar na roda de emotes'
                      }
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
      </div>
    </div>
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

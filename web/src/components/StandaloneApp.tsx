import { useEffect, useState } from 'react'
import { MriButton, MriSearchInput, MriSegmentedTabs } from '@mriqbox/ui-kit'
import { Footprints, Smile, Star, X } from 'lucide-react'
import { useMenuState } from '@/hooks/useMenuState'
import { EmoteList } from '@/components/EmoteList'
import { SlotBar } from '@/components/SlotBar'
import { SlotEditor } from '@/components/SlotEditor'
import { CATEGORY_LABEL, type SlotId } from '@/types'

export function StandaloneApp() {
  const menu = useMenuState()
  const [editing, setEditing] = useState<SlotId | null>(null)

  // ESC fecha. Com SetNuiFocus(true, true) o teclado vai para o CEF, então o
  // Lua não vê a tecla — o fechamento tem que sair daqui.
  useEffect(() => {
    if (!menu.visible) return
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        if (editing) setEditing(null)
        else menu.close()
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [menu.visible, menu, editing])

  if (!menu.visible) return null

  const tabs = [
    { id: '__favorites', label: 'Favoritos', icon: Star },
    ...menu.categories
      .filter((c) => c.id !== 'Walks' && c.id !== 'Expressions' && c.id !== 'Exits')
      .map((c) => ({ id: c.id, label: CATEGORY_LABEL[c.id] ?? c.id })),
    { id: 'Walks', label: 'Andar', icon: Footprints },
    { id: 'Expressions', label: 'Humor', icon: Smile },
  ]

  const isWalks = menu.category === 'Walks'
  const isMoods = menu.category === 'Expressions'

  return (
    <div className="relative h-full w-full">
      <div className="emote-backdrop" />

      <div className="relative grid h-full grid-cols-[minmax(340px,1.15fr)_1fr_minmax(280px,0.75fr)] gap-6 p-8">
        {/* ---------- Coluna esquerda: catálogo ---------- */}
        <section className="flex min-h-0 flex-col gap-3">
          <header>
            <h1 className="text-2xl font-bold tracking-tight text-foreground">Emotes</h1>
            {/* Andar e Humor não têm pré-visualização: walkstyle só aparece com o
                ped andando, e expressão é só o rosto. Dizer isso evita o "o
                preview não funciona" quando na verdade não há o que mostrar. */}
            <p className="text-xs text-muted-foreground">
              {isWalks
                ? 'Clique para aplicar. Estilos de andar não têm pré-visualização.'
                : isMoods
                  ? 'Clique para aplicar. A expressão muda só o rosto do personagem.'
                  : 'Passe o mouse para pré-visualizar, clique para executar.'}
            </p>
          </header>

          <MriSearchInput
            value={menu.search}
            onChange={menu.setSearch}
            placeholder="Buscar em todas as categorias..."
          />

          {/* O container do MriSegmentedTabs vem com
              "border border-border backdrop-blur-sm shadow-inner" + "bg-muted".
              Sobre um NUI transparente isso vira uma barra preta flutuando no
              meio do jogo — o `backdrop-blur-sm` é o que mais escurece, porque
              borra o que está atrás. Anulamos os quatro; tailwind-merge resolve
              o conflito em favor do que passamos aqui. */}
          <MriSegmentedTabs
            items={tabs}
            value={menu.category}
            onChange={menu.setCategory}
            className="flex-wrap bg-transparent backdrop-blur-none border-transparent shadow-none p-0"
          />

          <div className="min-h-0 flex-1 rounded-xl border border-border bg-card/50">
            {isWalks || isMoods ? (
              <EmoteList
                entries={menu.visibleEmotes}
                favorites={menu.data.favorites}
                selected={isWalks ? (menu.data.walk ?? null) : (menu.data.mood ?? null)}
                onPlay={(entry) =>
                  isWalks ? void menu.setWalk(entry.name) : void menu.setMood(entry.name)
                }
                onPreview={() => undefined}
                onToggleFavorite={menu.toggleFavorite}
              />
            ) : (
              <EmoteList
                entries={menu.visibleEmotes}
                favorites={menu.data.favorites}
                selected={menu.selected}
                onPlay={menu.play}
                onPreview={menu.preview}
                onToggleFavorite={menu.toggleFavorite}
              />
            )}
          </div>

          <p className="text-[11px] text-muted-foreground">
            {menu.visibleEmotes.length} de {menu.data.catalog.length} emotes
          </p>
        </section>

        {/* ---------- Coluna central: o ped da scaleform aparece aqui ----------
            Nada opaco nesta coluna. O jogo desenha o ped clonado atrás da NUI. */}
        <section className="ped-slot" aria-hidden />

        {/* ---------- Coluna direita: atalhos e ações ---------- */}
        <section className="flex min-h-0 flex-col gap-4">
          <div className="flex justify-end">
            <MriButton variant="ghost" size="sm" onClick={menu.close}>
              <X className="mr-1.5 h-4 w-4" />
              Fechar
            </MriButton>
          </div>

          <div className="rounded-xl border border-border bg-card/70 p-4">
            <SlotBar
              slots={menu.data.slots}
              catalog={menu.data.catalog}
              onEdit={(slot) => setEditing(slot)}
            />
          </div>

          <div className="rounded-xl border border-border bg-card/70 p-4">
            <h3 className="mb-2 text-sm font-semibold text-foreground">Atual</h3>
            <dl className="space-y-1 text-xs">
              <div className="flex justify-between gap-2">
                <dt className="text-muted-foreground">Andar</dt>
                <dd className="truncate text-foreground">{menu.data.walk ?? 'padrão'}</dd>
              </div>
              <div className="flex justify-between gap-2">
                <dt className="text-muted-foreground">Humor</dt>
                <dd className="truncate text-foreground">{menu.data.mood ?? 'padrão'}</dd>
              </div>
            </dl>

            <div className="mt-3 flex gap-2">
              <MriButton variant="secondary" size="sm" onClick={() => void menu.setWalk(undefined)}>
                Resetar andar
              </MriButton>
              <MriButton variant="secondary" size="sm" onClick={() => void menu.setMood(undefined)}>
                Resetar humor
              </MriButton>
            </div>
          </div>

          <MriButton variant="destructive" onClick={menu.cancel}>
            Cancelar emote
          </MriButton>
        </section>
      </div>

      {editing && (
        <SlotEditor
          slot={editing}
          slots={menu.data.slots}
          catalog={menu.data.catalog}
          onSave={menu.setSlot}
          onClose={() => setEditing(null)}
        />
      )}
    </div>
  )
}

import { useCallback, useMemo, useState } from 'react'
import { fetchNui } from '@/nui/fetchNui'
import { useNuiEvent } from '@/nui/useNuiEvent'
import type { EmoteEntry, MenuPayload, SlotId, SlotMap } from '@/types'

const EMPTY: MenuPayload = {
  catalog: [],
  slots: {},
  favorites: [],
  isAdmin: false,
  arrows: {} as MenuPayload['arrows'],
}

export function useMenuState() {
  const [visible, setVisible] = useState(false)
  const [data, setData] = useState<MenuPayload>(EMPTY)
  const [category, setCategory] = useState<string>('Emotes')
  const [search, setSearch] = useState('')
  const [selected, setSelected] = useState<string | null>(null)

  useNuiEvent<{ visible: boolean; data?: MenuPayload }>('setVisible', (msg) => {
    setVisible(msg.visible)
    if (msg.visible && msg.data) setData(msg.data)
    if (!msg.visible) {
      setSearch('')
      setSelected(null)
    }
  })

  useNuiEvent<{ slots: SlotMap }>('slotsUpdated', (msg) => {
    setData((prev) => ({ ...prev, slots: msg.slots ?? {} }))
  })

  useNuiEvent<{ favorites: string[] }>('favoritesUpdated', (msg) => {
    setData((prev) => ({ ...prev, favorites: msg.favorites ?? [] }))
  })

  const categories = useMemo(() => {
    const seen = new Map<string, number>()
    for (const entry of data.catalog) {
      seen.set(entry.category, (seen.get(entry.category) ?? 0) + 1)
    }
    return [...seen.entries()].map(([id, count]) => ({ id, count }))
  }, [data.catalog])

  const visibleEmotes = useMemo(() => {
    const term = search.trim().toLowerCase()

    // Busca ignora a categoria: procurar "salute" tem que achar mesmo estando
    // em Danças. Sem termo, filtra pela aba atual.
    const base =
      category === '__favorites'
        ? data.catalog.filter((e) => data.favorites.includes(e.name))
        : term
          ? data.catalog
          : data.catalog.filter((e) => e.category === category)

    if (!term) return base
    return base.filter(
      (e) => e.label.toLowerCase().includes(term) || e.name.toLowerCase().includes(term),
    )
  }, [data.catalog, data.favorites, category, search])

  const play = useCallback((entry: EmoteEntry, variation?: number) => {
    void fetchNui('playEmote', { name: entry.name, variation })
  }, [])

  const preview = useCallback((entry: EmoteEntry | null) => {
    setSelected(entry?.name ?? null)
    if (!entry) {
      void fetchNui('clearPreview')
      return
    }
    void fetchNui('previewEmote', { name: entry.name })
  }, [])

  const close = useCallback(() => {
    void fetchNui('hideFrame')
  }, [])

  const cancel = useCallback(() => {
    void fetchNui('cancelEmote')
  }, [])

  const toggleFavorite = useCallback(async (name: string) => {
    const res = await fetchNui<{ ok: boolean; favorites: string[] }>('toggleFavorite', { name })
    if (res?.ok) setData((prev) => ({ ...prev, favorites: res.favorites ?? [] }))
  }, [])

  const setSlot = useCallback(async (slot: SlotId, emote?: string, label?: string) => {
    const res = await fetchNui<{ ok: boolean; slots: SlotMap }>('setSlot', { slot, emote, label })
    if (res?.ok && res.slots) setData((prev) => ({ ...prev, slots: res.slots }))
    return Boolean(res?.ok)
  }, [])

  const setWalk = useCallback(async (name?: string) => {
    await fetchNui('setWalk', { name })
    setData((prev) => ({ ...prev, walk: name }))
  }, [])

  const setMood = useCallback(async (name?: string) => {
    await fetchNui('setMood', { name })
    setData((prev) => ({ ...prev, mood: name }))
  }, [])

  return {
    visible,
    data,
    category,
    setCategory,
    search,
    setSearch,
    selected,
    categories,
    visibleEmotes,
    play,
    preview,
    close,
    cancel,
    toggleFavorite,
    setSlot,
    setWalk,
    setMood,
  }
}

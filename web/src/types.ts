// Espelho do indice que client/catalog.lua monta (buildIndex) e do payload
// montado por client/nui.lua (buildPayload).

export type EmoteCategory =
  | 'Emotes'
  | 'PropEmotes'
  | 'Dances'
  | 'AnimalEmotes'
  | 'Shared'
  | 'Walks'
  | 'Expressions'
  | 'Exits'
  | string

export interface EmoteEntry {
  name: string
  label: string
  category: EmoteCategory
  prop?: boolean
  variations?: number
  shared?: boolean
  adult?: boolean
  animal?: boolean
  scenario?: boolean
  /** Preenchido pela varredura do client: 'anim' = dict ausente, 'prop' = modelo ausente. */
  missing?: 'anim' | 'prop'
}

/** Apelidos do player, por nome de emote. Só contém o que foi renomeado. */
export type NicknameMap = Record<string, string>

/** Slots da roda. Posição vazia é `false` — o Lua não usa nil para não virar objeto no JSON. */
export type Wheel = (string | false)[]

export type SlotId = 'UP' | 'DOWN' | 'LEFT' | 'RIGHT'

export interface Slot {
  emote: string
  label?: string
  /** de onde veio o valor resolvido — override do player, padrão do servidor ou config */
  source: 'player' | 'server' | 'config'
}

export type SlotMap = Partial<Record<SlotId, Slot>>

export interface MenuPayload {
  catalog: EmoteEntry[]
  slots: SlotMap
  favorites: string[]
  nicknames: NicknameMap
  wheel: Wheel
  wheelSlots: number
  walk?: string
  mood?: string
  isAdmin: boolean
  arrows: Record<SlotId, number[]>
}

/** Nome exibido: apelido do player > label do catálogo > nome cru. */
export function displayName(entry: EmoteEntry, nicknames: NicknameMap): string {
  return nicknames[entry.name] || entry.label || entry.name
}

export const SLOT_ORDER: SlotId[] = ['UP', 'DOWN', 'LEFT', 'RIGHT']

export const SLOT_LABEL: Record<SlotId, string> = {
  UP: 'Seta para cima',
  DOWN: 'Seta para baixo',
  LEFT: 'Seta para esquerda',
  RIGHT: 'Seta para direita',
}

export const SLOT_GLYPH: Record<SlotId, string> = {
  UP: '↑',
  DOWN: '↓',
  LEFT: '←',
  RIGHT: '→',
}

/** Rótulo humano por categoria. Chaves batem com Category do shared/types.lua. */
export const CATEGORY_LABEL: Record<string, string> = {
  Emotes: 'Emotes',
  PropEmotes: 'Com prop',
  Dances: 'Danças',
  Shared: 'Em dupla',
  AnimalEmotes: 'Animais',
  Walks: 'Andar',
  Expressions: 'Humor',
  Exits: 'Saídas',
}

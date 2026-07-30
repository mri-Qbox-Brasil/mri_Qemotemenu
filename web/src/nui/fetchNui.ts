// Ponte NUI → Lua: `fetch("https://mri_Qemotemenu/<callback>")` cai nos
// RegisterNUICallback do NOSSO client.lua, mesmo quando a página está rodando
// dentro do iframe do mri_Qadmin (o iframe herda o origin cfx-nui-mri_Qemotemenu).

declare const GetParentResourceName: (() => string) | undefined

export function getResourceName(): string {
  // Em modo embedded o CEF NÃO injeta `GetParentResourceName` no iframe, então
  // derivamos do hostname `cfx-nui-<resource>` — confiável nos dois modos.
  if (typeof window !== 'undefined') {
    const host = window.location.hostname
    if (host.startsWith('cfx-nui-')) return host.slice('cfx-nui-'.length)
  }
  return typeof GetParentResourceName === 'function' ? GetParentResourceName() : 'mri_Qemotemenu'
}

export async function fetchNui<T = unknown>(event: string, data: unknown = {}): Promise<T | null> {
  if (import.meta.env.DEV) {
    console.debug('[nui →]', event, data)
    return null
  }

  try {
    const resp = await fetch(`https://${getResourceName()}/${event}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify(data),
    })
    if (!resp.ok) return null
    const text = await resp.text()
    return text ? (JSON.parse(text) as T) : null
  } catch {
    return null
  }
}

import { useEffect } from 'react'
import type { MriPluginUiConfig } from './types'

/**
 * Aplica o estilo visual herdado do painel /uiconfig do ox_lib, repassado pelo
 * mri_Qadmin nas mensagens `init` / `theme-changed`.
 *
 * Divisão de autoridade (mesma do host): accent e background são donos do
 * Qadmin e chegam por campos próprios — tratados em `lib/color.ts`. Aqui só
 * radius, fonte, cores de status e dimensões.
 */

const HEX_RE = /^#[0-9a-f]{6}$/i
const isValidHex = (v: unknown): v is string => typeof v === 'string' && HEX_RE.test(v)

export function applyUiConfig(cfg: MriPluginUiConfig | null | undefined): void {
  if (!cfg) return
  const root = document.documentElement

  if (typeof cfg.radius === 'number') {
    root.style.setProperty('--radius', `${cfg.radius}px`)
  }

  if (cfg.fontFamily) {
    root.style.setProperty(
      '--ui-font-family',
      `"${cfg.fontFamily}", "Saira", ui-sans-serif, sans-serif`,
    )
  }

  if (typeof cfg.glassOpacity === 'number') {
    root.style.setProperty('--ui-glass-opacity', String(cfg.glassOpacity))
  }

  if (isValidHex(cfg.successColor)) root.style.setProperty('--ui-success', cfg.successColor)
  if (isValidHex(cfg.warningColor)) root.style.setProperty('--ui-warning', cfg.warningColor)
  if (isValidHex(cfg.errorColor)) root.style.setProperty('--ui-error', cfg.errorColor)

  const px = (name: string, v: number | undefined) => {
    if (typeof v === 'number' && v > 0) root.style.setProperty(name, `${v}px`)
  }
  px('--ui-notify-width', cfg.notifyWidth)
  px('--ui-progress-width', cfg.progressBarWidth)
  px('--ui-progress-height', cfg.progressBarHeight)
  px('--ui-progress-circle', cfg.progressCircleSize)
  px('--ui-menu-width', cfg.menuWidth)
  px('--ui-context-width', cfg.contextWidth)
}

export function useUiConfig(cfg: MriPluginUiConfig | null | undefined): void {
  useEffect(() => applyUiConfig(cfg), [cfg])
}

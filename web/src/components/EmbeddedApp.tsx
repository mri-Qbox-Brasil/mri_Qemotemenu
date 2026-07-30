import { usePluginBridgeGuest } from '@/plugin/usePluginBridge'
import { useUiConfig } from '@/plugin/applyUiConfig'
import { useAccentColor, useBackgroundColor } from '@/lib/color'
import { AdminDefaults } from './AdminDefaults'

// Modo embedded: hospedado pelo mri_Qadmin. Tema, locale e permissoes chegam
// pelo bridge (postMessage); os dados vem dos nossos proprios NUI callbacks.
//
// O hook posta `mri-plugin/ready` no mount — sem isso o host mostra
// "Plugin indisponivel" depois de 10s.
export function EmbeddedApp() {
  const bridge = usePluginBridgeGuest()
  useAccentColor(bridge.accentColor)
  useBackgroundColor(bridge.backgroundColor)
  useUiConfig(bridge.uiConfig)

  return (
    <div className="h-full w-full overflow-hidden bg-background text-foreground">
      <AdminDefaults onClose={bridge.requestClose} />
    </div>
  )
}

import { useIsEmbedded } from '@/plugin/useIsEmbedded'
import { EmbeddedApp } from '@/components/EmbeddedApp'
import { StandaloneApp } from '@/components/StandaloneApp'

export default function App() {
  const embedded = useIsEmbedded()
  return embedded ? <EmbeddedApp /> : <StandaloneApp />
}

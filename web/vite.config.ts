import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

// A NUI do FiveM serve os arquivos por `nui://`, então todo asset precisa de
// caminho RELATIVO. Sem `base: './'` o bundle aponta para `/assets/...` e a
// tela fica em branco — tanto standalone quanto dentro do iframe do Qadmin.
export default defineConfig({
  plugins: [react()],
  base: './',
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  build: {
    outDir: 'build',
    emptyOutDir: true,
    // Hash no nome força o CEF a baixar o bundle novo. O Qadmin já faz
    // cache-bust por querystring no iframe, mas o `index.html` em si é
    // cacheado por URL — os assets com hash cobrem o resto.
    rollupOptions: {
      output: {
        entryFileNames: 'assets/[name]-[hash].js',
        chunkFileNames: 'assets/[name]-[hash].js',
        assetFileNames: 'assets/[name]-[hash][extname]',
      },
    },
  },
})

# mri_Qemotemenu

Menu de emotes em NUI para mri qbox, com preview de personagem em 3D, favoritos nas setas e atalhos personalizáveis por jogador.

Substitui o `rpemotes-reborn` mantendo o mesmo catálogo de animações e os mesmos assets de stream.

## Principais recursos

- **Menu em NUI** — React + `@mriqbox/ui-kit`, com busca em todas as categorias, favoritos e filtros. Substitui o NativeUI em scaleform do rpemotes.
- **Preview do personagem** — o emote toca num clone do seu ped, entregue à scaleform do menu de pausa do jogo (mesma técnica da `gh-arenapaintball`), com a NUI transparente por cima.
- **Atalhos que respeitam o resto do servidor** — os favoritos ficam nas setas e se calam sozinhos quando qualquer outro resource está usando as direcionais. Nenhum export precisa ser chamado por ninguém.
- **Atalhos personalizáveis** — cada jogador troca o emote de cada seta e dá um nome próprio ao atalho; fica salvo por personagem. O admin define os padrões do servidor.

## Instalação rápida

1. Copie a pasta `mri_Qemotemenu` para a pasta de resources do servidor.
2. Execute `_INSTALL/SQL/install.sql` no banco.
3. O resource é carregado pelo `ensure [mri]`; não precisa de linha própria no `server.cfg`.
4. Se for buildar a NUI: `cd web && pnpm install && pnpm build` (o `web/build` já vem versionado).

## Configuração

Tudo em `shared/config.lua`.

### Dependências obrigatórias

| Dependência | Para que é utilizada |
|---|---|
| `ox_lib` | keybinds, callbacks, notificações e locale |
| `qbx_core` | identificação do personagem (citizenid) |
| `oxmysql` | persistência de atalhos e preferências |

### Dependências opcionais

| Dependência | Efeito |
|---|---|
| `mri_Qadmin` | registra a tela de administração dos padrões como plugin do painel |
| `core_cinematics` | integração de gravação via `client/cinematics.lua` |

### Permissões

A edição dos padrões do servidor exige a permissão `emotes.manage` no `mri_Qadmin`, ou o ACE `command.mriqemotemenu` quando o painel não está disponível.

## Comandos

| Comando | Descrição |
|---|---|
| `/e <emote> [variação]` | Executa um emote. `/e c` cancela. Aliases: `/emote`, `/eplay`. |
| `/emotemenu` | Abre o menu. Aliases: `/emoteui`, `/em`. Tecla padrão: `F5`. |
| `/emotecancel` | Cancela o emote atual. Tecla padrão: `F6`. |
| `/emotes`, `/dances`, `/propemotes` | Listam os emotes de cada categoria. |
| `/walk <estilo>` | Define o estilo de andar. `/walk reset` volta ao normal. Aliases: `/w`, `/andar`. |
| `/walks` | Lista os estilos de andar. |
| `/mood <expressão>` | Define a expressão facial. `/mood reset` volta ao normal. |
| `/moods` | Lista as expressões. |
| `/nearby <emote>` | Convida quem está por perto para um emote em dupla. |
| `/emotebind <seta> <emote> [nome]` | Define um atalho de seta. Ex.: `/emotebind cima salute Cumprimentar`. |
| `/emotebinds` | Lista os seus atalhos e de onde veio cada um. |
| `/emotedelete <seta>` | Remove o seu atalho e volta ao padrão do servidor. |
| `/emoteguard` | Diagnóstico: mostra por que cada seta está liberada ou bloqueada agora. |
| `/emotedefault <slot> <emote>` | Admin. Define o padrão do servidor para um slot. |
| `/emotedefaults` | Admin. Lista os padrões do servidor. |
| `emoteextract <1-5>` | Console. Exporta o catálogo para conferência. |

## Exports

### Client

| Export | Descrição |
|---|---|
| `EmoteCommandStart(nome, variação?)` | Executa um emote. Compatível com o rpemotes. |
| `EmoteCancel(force?)` | Cancela o emote atual. |
| `IsPlayerInAnim()` | Nome do emote em execução, ou `nil`. |
| `getCurrentEmote()` | Tabela do emote em execução. |
| `GetMenuPed()` | Handle do ped de preview, ou `0`. |
| `playEmoteByCommand(cmd, variação?, ped?)` | Compatível com o scully. Com `ped`, toca num ped arbitrário. |
| `playEmote(data, variação?, ped?)` | Idem, aceitando tabela. |
| `cancelEmote(skipReset?)` | Compatível com o scully. |
| `setLimitation(state)` / `isLimited()` | Bloqueia ou libera a execução de emotes. |
| `isInEmote()` / `getLastEmote()` | Estado atual. |
| `setWalk(clipset)` / `resetWalk()` / `getCurrentWalk()` | Estilo de andar. |
| `setExpression(nome)` / `resetExpression()` / `getCurrentExpression()` | Expressão facial. |
| `setWalkstyle(nome)` / `getWalkstyle()` / `toggleWalkstyle(bool, msg?)` | Estilo de andar, API do rpemotes. |
| `toggleMenu()` / `closeMenu()` / `listEmotes(tipo)` | Controle do menu. |
| `registerEmote(tabela)` / `playRegisteredEmote(nome)` | Emotes injetados por outros resources. |
| `GetCatalog(categoria?)` | Catálogo no formato do scully (`{ Label, Command, ... }`). |

### Server

| Export | Descrição |
|---|---|
| `GetSlotDefaults()` | Padrões de atalho do servidor. |
| `SetSlotDefault(slot, emote, label?)` | Altera um padrão. Sem checagem de ACE — uso interno do servidor. |

## Compatibilidade

O resource declara `provide` para `rpemotes`, `rpemotes-reborn`, `dpemotes` e `scully_emotemenu`, então `exports['rpemotes-reborn']:EmoteCancel()` e afins continuam funcionando sem ninguém editar nada. Os eventos `animations:client:*` e `scully_emotemenu:*` também estão registrados.

**Uma exceção proposital:** não existe `DisableEmoteKeybinds`. Era o export que obrigava todo resource com setas a avisar o menu de emotes — e que quebrava em silêncio sempre que alguém esquecia de chamá-lo ou de restaurá-lo. O `client/inputguard.lua` resolve isso sozinho.

> `provide` faz o `exports[...]` resolver, mas **não** faz `GetResourceState('rpemotes-reborn')` retornar `started`. Quem protege a chamada com `GetResourceState` precisa passar a testar `mri_Qemotemenu`.

## Estrutura de arquivos

```
mri_Qemotemenu/
├── client/
├── server/
├── shared/
├── data/            catálogo de animações
├── locales/
├── stream/          assets (não versionado)
├── web/             NUI React + Vite
├── _INSTALL/SQL/
└── fxmanifest.lua
```

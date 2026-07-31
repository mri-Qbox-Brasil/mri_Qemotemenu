# mri_Qemotemenu

Sistema de emotes para mri qbox: menu em NUI, preview do personagem em estúdio 3D, roda de emotes e atalhos personalizáveis por jogador.

## Principais recursos

- **Menu em NUI** — React + `@mriqbox/ui-kit`, com busca em todas as categorias, favoritos, filtros e lista virtualizada (o catálogo passa de 3.700 emotes).
- **Preview em estúdio** — ao passar o mouse, um clone do seu personagem executa o emote num ponto isolado, com câmera e iluminação próprias. Enquadramento igual sempre, de dia ou de madrugada.
- **Roda de emotes** — seis slots equipáveis pelo menu e usados pela roda do `ox_lib` no F1.
- **Atalhos que respeitam o resto do servidor** — os favoritos ficam nas setas e se calam sozinhos quando qualquer outro resource está usando as direcionais. Nenhum export precisa ser chamado por ninguém.
- **Atalhos personalizáveis** — cada jogador troca o emote de cada seta e dá um nome próprio ao atalho; fica salvo por personagem. O admin define os padrões do servidor.
- **Apelidos** — qualquer emote pode ser renomeado, e o nome novo vale só para quem renomeou.
- **Aviso de indisponível** — emote cuja animação ou objeto não existe no cliente aparece marcado na lista, antes de o jogador clicar.

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
| `ox_lib` | keybinds, callbacks, notificações, locale e a roda de emotes |
| `qbx_core` | identificação do personagem (citizenid) |
| `oxmysql` | persistência de atalhos e preferências |

### Dependências opcionais

| Dependência | Efeito |
|---|---|
| `mri_Qadmin` | registra a tela de administração dos padrões como plugin do painel |
| `core_cinematics` | integração de gravação via `client/cinematics.lua` |
| `ghds_advancedhud`, `jg-hud`, `mri_Qhud` | a HUD some enquanto o menu está aberto e volta ao fechar |

### HUD

Com o menu aberto a HUD sai da frente e volta ao fechar — o preview é uma cena
montada com câmera própria, e barra de fome ou minimapa por cima dela não fazem
sentido. Vale para a HUD nativa do GTA e para as HUDs em NUI reconhecidas.

Cada HUD tem o seu jeito de sumir, então a lista fica em `Config.HudIntegrations`
e é só acrescentar uma entrada para integrar outra:

```lua
{
    resource = 'nome-da-hud',
    hide = function() exports['nome-da-hud']:toggleHud(false) end,
    show = function() exports['nome-da-hud']:toggleHud(true) end,
}
```

A entrada só entra em ação quando aquele resource está no ar, e o `show` só roda
se o `hide` tiver funcionado — assim um erro do lado da HUD não deixa o jogador
sem ela depois de fechar o menu.

> **O `mri_Qhud` exige uma contraparte nele.** Ele não expunha nada, então o
> evento `hud:client:setVisible` foi adicionado do lado dele. Num `mri_Qhud` sem
> esse trecho a integração não faz efeito — o evento é disparado e ninguém
> escuta. O `MANUAL.md` explica o que foi feito lá.

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
| `/emotepreview` | Diagnóstico e calibração do preview. Ver `MANUAL.md`. |
| `/emotedefault <slot> <emote>` | Admin. Define o padrão do servidor para um slot. |
| `/emotedefaults` | Admin. Lista os padrões do servidor. |
| `emoteextract <1-5>` | Console. Exporta o catálogo para conferência. |

## Exports

### Client

| Export | Descrição |
|---|---|
| `EmoteCommandStart(nome, variação?)` | Executa um emote. |
| `EmoteCancel(force?)` | Cancela o emote atual. |
| `IsPlayerInAnim()` | Nome do emote em execução, ou `nil`. |
| `getCurrentEmote()` | Tabela do emote em execução. |
| `GetMenuPed()` | Handle do ped de preview, ou `0`. |
| `playEmoteByCommand(cmd, variação?, ped?)` | Executa um emote. Com `ped`, toca num ped arbitrário. |
| `playEmote(data, variação?, ped?)` | Idem, aceitando tabela. |
| `cancelEmote(skipReset?)` | Cancela o emote atual. |
| `setLimitation(state)` / `isLimited()` | Bloqueia ou libera a execução de emotes. |
| `isInEmote()` / `getLastEmote()` | Estado atual. |
| `setWalk(clipset)` / `resetWalk()` / `getCurrentWalk()` | Estilo de andar. |
| `setWalkstyle(nome)` / `getWalkstyle()` / `toggleWalkstyle(bool, msg?)` | Estilo de andar, por nome do catálogo. |
| `setExpression(nome)` / `resetExpression()` / `getCurrentExpression()` | Expressão facial. |
| `toggleMenu()` / `closeMenu()` / `listEmotes(tipo)` | Controle do menu. |
| `registerEmote(tabela)` / `playRegisteredEmote(nome)` | Emotes injetados por outros resources. |
| `GetCatalog(categoria?)` | Catálogo em formato `{ Label, Command, ... }`. |

### Server

| Export | Descrição |
|---|---|
| `GetSlotDefaults()` | Padrões de atalho do servidor. |
| `SetSlotDefault(slot, emote, label?)` | Altera um padrão. Sem checagem de ACE — uso interno do servidor. |

## Compatibilidade

Para não obrigar todo o servidor a reescrever chamadas, o resource responde pelos nomes dos sistemas de emote mais comuns. O `fxmanifest.lua` declara `provide` para `rpemotes`, `rpemotes-reborn`, `dpemotes` e `scully_emotemenu`, então `exports['rpemotes-reborn']:EmoteCancel()` e afins continuam funcionando sem ninguém editar nada. Os eventos `animations:client:*` e `scully_emotemenu:*` também estão registrados, e os comandos `/e`, `/emote`, `/w` e `/em` respondem como esperado.

**Uma exceção proposital:** não existe `DisableEmoteKeybinds`. Era o export que obrigava todo resource com setas a avisar o menu de emotes — e que quebrava em silêncio sempre que alguém esquecia de chamá-lo ou de restaurá-lo. O `client/inputguard.lua` resolve isso sozinho, olhando foco de NUI, pause menu, statebags e controles desabilitados no frame.

> `provide` faz o `exports[...]` resolver, mas **não** faz `GetResourceState('rpemotes-reborn')` retornar `started`. Quem protege a chamada com `GetResourceState` precisa passar a testar `mri_Qemotemenu`.

## Trazendo emotes de outro sistema

O catálogo vive em `data/animations_custom.lua` — é o arquivo feito para receber acréscimos, e ele nunca é sobrescrito por atualização do resource.

### Assets

Vale para qualquer origem: copie os `.ycd`, `.ydr` e `.ytd` para `stream/`, mantendo as subpastas se quiser.

Um detalhe que passa despercebido: **todo `.ytyp` precisa de uma linha própria no `fxmanifest.lua`**, senão os props daquele pacote simplesmente não registram e o emote toca sem o objeto na mão.

```lua
data_file "DLC_ITYP_REQUEST" "stream/nome_do_pacote.ytyp"
```

O caminho é resolvido por nome de arquivo, então não importa em que subpasta o `.ytyp` está.

### Entradas do catálogo

Adicione dentro da categoria certa em `data/animations_custom.lua`:

```lua
CustomDP.Emotes = {
    ["nomedoemote"] = { "dicionario@da@anim", "nome_da_anim", "Nome Exibido",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            Prop = "prop_modelo",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
        }
    },
}
```

**Vindo do rpemotes / dpemotes:** o formato é o mesmo. As entradas do `AnimationList.lua` de lá podem ser coladas direto na categoria correspondente.

**Vindo do scully:** o formato é diferente — lá cada emote é um item de uma lista com campos em PascalCase. A conversão é mecânica:

| scully | aqui |
|---|---|
| `Command` | a chave da entrada |
| `Dictionary` | 1ª posição |
| `Animation` | 2ª posição |
| `Label` | 3ª posição |
| `Options.Flags.Loop` | `AnimationOptions.EmoteLoop` |
| `Options.Flags.Move` | `AnimationOptions.EmoteMoving` |
| `Options.Duration` | `AnimationOptions.EmoteDuration` |
| `Options.Props[1].Name` | `AnimationOptions.Prop` |
| `Options.Props[1].Bone` | `AnimationOptions.PropBone` |
| `Options.Props[1].Placement` | `AnimationOptions.PropPlacement`, achatado em seis números (x, y, z, rx, ry, rz) |

Depois de reiniciar o resource, os emotes que não encontrarem a animação aparecem marcados em vermelho na lista — é a forma mais rápida de conferir se os assets entraram certo.

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

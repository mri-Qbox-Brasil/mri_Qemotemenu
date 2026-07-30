# Manual do mri_Qemotemenu

## Visão Geral

Sistema de emotes do servidor: catálogo completo de animações, menu em NUI com preview do personagem, atalhos nas setas e preferências salvas por personagem.

Nasceu como substituto do `rpemotes-reborn`. O catálogo de animações e os assets de stream são os mesmos, entrada por entrada — nenhum emote foi renomeado ou removido na migração, inclusive os que tinham nome divergente do que fazem.

## Funcionalidades

- **Catálogo completo**: emotes, danças, cenários, emotes com prop (incluindo variações de textura), emotes em dupla, emotes de animal, estilos de andar e expressões faciais.
- **Menu em NUI**: busca que atravessa todas as categorias, favoritos marcáveis com estrela e um painel lateral com os atalhos.
- **Preview do personagem**: ao passar o mouse por um emote, um clone do seu personagem executa a animação, com props e tudo. O clone é local — nenhum outro jogador enxerga.
- **Atalhos nas setas**: quatro slots, um por seta. Cada jogador escolhe o emote de cada slot e pode dar um nome próprio ao atalho.
- **Padrões de servidor**: administradores definem o emote inicial de cada seta para quem nunca personalizou.

## Como Funciona

### Atalhos e precedência

Cada seta resolve o emote em três níveis, do mais forte para o mais fraco:

1. **O ajuste do jogador** — o que ele escolheu no menu ou pelo `/emotebind`.
2. **O padrão do servidor** — definido pelo administrador.
3. **O padrão do arquivo** — `shared/config.lua`, usado enquanto os dois acima não existirem.

Consequência prática: quando um administrador troca o padrão de uma seta, **quem já personalizou aquele slot não sente diferença**. A mudança só alcança quem estava no padrão.

Padrões de fábrica, herdados do rpemotes-reborn:

| Seta | Emote |
|---|---|
| Cima | `salute` |
| Baixo | `assobiar` |
| Esquerda | `joia` |
| Direita | `wtf4` |

> O atalho da direita se chama `ultra_facepalm` nas configurações de tecla do FiveM, mas executa `wtf4`. É uma divergência herdada, mantida de propósito para não mudar o comportamento de quem já jogava.

### Por que as setas não atrapalham outros scripts

Antes, qualquer resource que usasse as setas precisava avisar o menu de emotes com `DisableEmoteKeybinds(true)` e lembrar de reverter com `false`. Quem esquecia deixava emotes disparando por cima do próprio menu — ou, pior, deixava os emotes mortos até o jogador reconectar.

O `mri_Qemotemenu` não tem esse export. Antes de executar um atalho, ele verifica sozinho:

| Situação | Resultado |
|---|---|
| Qualquer NUI com foco (chat, celular, MDT, menus do ox_lib, o próprio menu) | não dispara |
| Menu de pausa ou aviso do jogo aberto | não dispara |
| Outro resource desabilitou o controle daquela seta neste frame | não dispara |
| `LocalPlayer.state.canEmote` está `false` | não dispara |
| Jogador morto, algemado, em ragdoll, mirando, ou na água | não dispara |

O terceiro item é o que faz o trabalho pesado: todo menu nativo desabilita as direcionais a cada frame para o jogador não sair andando enquanto navega. Isso já é sinal suficiente.

Se algum menu ler as setas **sem** desabilitar os controles, ele não é detectável. Nesse caso — e só nesse — use o statebag:

```lua
LocalPlayer.state:set('emoteBindsBlocked', true)  -- ao abrir
LocalPlayer.state:set('emoteBindsBlocked', false) -- ao fechar
```

Para descobrir por que uma seta não está respondendo, use `/emoteguard`: ele lista cada slot e o motivo do bloqueio.

## Configuração

Opções em `shared/config.lua`.

| Opção | Padrão | Descrição |
|---|---|---|
| `Debug` | `false` | Log detalhado no console. |
| `MenuKeybind` | `f5` | Tecla que abre o menu. |
| `CancelEmoteKey` | `f6` | Tecla que cancela o emote. |
| `PreviewPed` | `true` | Preview do personagem no menu. |
| `FavoriteSlots` | 4 setas | Slots de atalho e seus padrões de fábrica. |
| `InputGuard` | todos ligados | Liga ou desliga cada sinal de detecção. |
| `AdultEmotesDisabled` | `false` | Esconde emotes marcados como adultos. |
| `AnimalEmotesEnabled` | `true` | Emotes de animal. |
| `SharedEmotesEnabled` | `true` | Emotes em dupla (`/nearby`). |
| `AllowEmoteInVehicle` | `true` | Permite emotes dentro de veículos. |
| `AllowInWater` | `false` | Permite emotes na água. |
| `CrouchEnabled` / `CrawlEnabled` | `false` | Desligados: quem cuida disso é o `crouch_crawl`. |
| `PointingEnabled` | `true` | Apontar o dedo, tecla `B`. |
| `HandsupEnabled` | `false` | Mãos ao alto. |
| `RagdollEnabled` | `false` | Ragdoll manual. |
| `BinocularsEnabled` / `NewscamEnabled` | `false` | Binóculos e câmera de reportagem. |
| `SaveDebounce` | `5000` | Milissegundos entre a última alteração e a gravação no banco. |

## Administração

A tela de padrões aparece como plugin dentro do `mri_Qadmin`, para quem tem a permissão `emotes.manage`. Também dá para usar comandos:

| Comando | Efeito |
|---|---|
| `/emotedefaults` | Lista os padrões atuais. |
| `/emotedefault <slot> <emote>` | Define o padrão de um slot. Ex.: `/emotedefault UP salute`. |

## Banco de dados

| Tabela | Conteúdo |
|---|---|
| `mri_qemotemenu_players` | Atalhos e preferências por `citizenid`. |
| `mri_qemotemenu_defaults` | Padrões de atalho do servidor. |

Os padrões ficam em memória e só são relidos quando alguém os altera. As preferências de cada jogador são carregadas no login, mantidas em memória e gravadas em lote — trocar o emote de um atalho não gera consulta ao banco.

## Solução de Problemas

- **Uma seta não executa o emote**: rode `/emoteguard`. Ele diz qual sinal está bloqueando aquele slot.
- **Um emote não toca e aparece "não é um emote válido"**: o nome está errado ou a animação exige um gamebuild mais novo. Confira com `/emotes`.
- **O prop de um emote não aparece**: o `.ytyp` do pacote precisa estar declarado no `fxmanifest.lua` como `DLC_ITYP_REQUEST`.
- **O preview não mostra o personagem**: verifique se `Config.PreviewPed` está `true`. Se um resource de HUD estiver forçando o menu de pausa, pode haver conflito.
- **Os atalhos voltaram ao padrão**: confirme que o SQL de `_INSTALL` foi executado. Sem as tabelas, nada é salvo.
- **Outro script de emotes está instalado junto**: só um pode estar ativo. Dois resources registrando `/e` e as mesmas teclas se atropelam.

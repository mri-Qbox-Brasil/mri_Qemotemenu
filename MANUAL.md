# Manual do mri_Qemotemenu

## Visão Geral

Sistema de emotes do servidor: catálogo completo de animações, menu em NUI com preview do personagem, roda de emotes, atalhos nas setas e preferências salvas por personagem.

O catálogo traz alguns nomes que não descrevem bem o que o emote faz. Eles foram mantidos como estão de propósito, para não quebrar quem já usava o comando — e é justamente para isso que existe o renomear, que deixa cada jogador ajustar o nome para si.

## Funcionalidades

- **Catálogo completo**: emotes, danças, cenários, emotes com prop (incluindo variações de textura), emotes em dupla, emotes de animal, estilos de andar e expressões faciais.
- **Menu em NUI**: busca que atravessa todas as categorias, favoritos marcáveis com estrela e um painel lateral com os atalhos.
- **Preview do personagem**: ao passar o mouse por um emote, um clone do seu personagem executa a animação, com props e tudo. O clone é local — nenhum outro jogador enxerga.
- **Atalhos nas setas**: quatro slots, um por seta. Cada jogador escolhe o emote de cada slot e pode dar um nome próprio ao atalho.
- **Padrões de servidor**: administradores definem o emote inicial de cada seta para quem nunca personalizou.
- **Roda de emotes**: seis slots equipáveis, usados pela roda do ox_lib no F1.
- **Apelidos**: qualquer emote pode ser renomeado, e o nome novo vale só para quem renomeou.
- **Aviso de indisponível**: emote cuja animação ou objeto não existe no cliente aparece marcado.

## Como Funciona

### Atalhos e precedência

Cada seta resolve o emote em três níveis, do mais forte para o mais fraco:

1. **O ajuste do jogador** — o que ele escolheu no menu ou pelo `/emotebind`.
2. **O padrão do servidor** — definido pelo administrador.
3. **O padrão do arquivo** — `shared/config.lua`, usado enquanto os dois acima não existirem.

Consequência prática: quando um administrador troca o padrão de uma seta, **quem já personalizou aquele slot não sente diferença**. A mudança só alcança quem estava no padrão.

Padrões de fábrica:

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

## Roda de emotes

O jogador equipa emotes pelo menu e usa pela roda do ox_lib, que neste servidor
abre no **F1**.

**Para equipar:** abra o menu (F5), passe o mouse num emote e clique no `+`. Abre
um seletor com os seis slots, mostrando o que já está em cada um. Clicar num slot
ocupado substitui; clicar no slot que já tem aquele emote o remove.

**Para usar:** F1 → *Emotes* → o emote. A roda executa direto.

Dois limites que vêm do ox_lib e não de escolha nossa:

- **São seis slots.** O `PAGE_ITEMS` da interface da roda é fixo em 6; do sétimo
  item em diante o último lugar vira um botão "mais" e come um slot.
- **Os emotes ficam um clique dentro da roda**, no item *Emotes*, em vez de
  aparecerem direto ao abrir. Não existe forma de abrir um submenu do ox_lib
  programaticamente, e pôr os seis na raiz brigaria com os itens do
  `qbx_radialmenu`.

Os slots são salvos por personagem, junto com favoritos e atalhos.

## Renomear emotes

O lápis em cada linha da lista dá um apelido pessoal ao emote — vale **só para
quem renomeou**, e aparece na lista, na busca, nos atalhos de seta e na roda. O
nome original continua visível entre parênteses. Deixar o campo vazio restaura.

Serve principalmente para arrumar os nomes herdados que não descrevem o emote.

## Emotes indisponíveis

Um triângulo vermelho na linha significa que aquele emote não pode ser executado
neste cliente: ou a animação não existe (arquivo ausente ou gamebuild antigo), ou
o objeto que ele usa não existe. Passe o mouse na marca para ver qual dos dois.

A verificação roda uma vez, alguns segundos depois do resource subir, e cobre
também as animações nativas do GTA. Emotes de cenário não têm como ser
verificados e nunca aparecem marcados.

## Configuração

Opções em `shared/config.lua`.

| Opção | Padrão | Descrição |
|---|---|---|
| `Debug` | `false` | Log detalhado no console. |
| `MenuKeybind` | `f5` | Tecla que abre o menu. |
| `CancelEmoteKey` | `f6` | Tecla que cancela o emote. |
| `PreviewPed` | `true` | Preview do personagem no menu. |
| `PreviewMode` | `'studio'` | Como o ped de preview é desenhado. Ver abaixo. |
| `StudioCoords` | interior isolado | Onde o clone é posicionado no modo estúdio. |
| `StudioCamLateral` | `-0.4` | Empurra o ped para o lado do quadro, liberando a tela para a interface. |
| `StudioForceDaytime` | `true` | Força luz de dia no preview. É client-side e vale só enquanto o menu está aberto. |
| `FreezePlayerWhileOpen` | `true` | Congela o personagem real enquanto o menu está aberto. |
| `PreviewBlur` | `true` | Só no modo `world`: desfoca o mundo atrás do ped. |
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

### Modos de preview

| Modo | Como funciona |
|---|---|
| `studio` (padrão) | Um clone do personagem é levado para um ponto isolado e uma câmera própria o enquadra. Fundo limpo, iluminação previsível e o mesmo enquadramento sempre, de dia ou de madrugada. |
| `world` | O clone fica visível no mundo, reposicionado a cada frame na frente da câmera do jogo. Mais leve — não troca a câmera nem carrega área nova — mas pega a iluminação do lugar e pode encostar em parede ou carro. |

> **Nota para quem for mexer no preview:** existe um caminho no jogo que desenha
> o ped no menu de pausa (`GivePedToPauseMenu`), com enquadramento e iluminação
> muito bons. Ele **não serve aqui**: aquele render ignora qualquer animação que
> o script mande, e a única que aceita é a de dormir, que é dele. Já foi tentado
> e descartado com o ped confirmadamente executando a animação enquanto a tela
> mostrava outra pose. Serve para retrato parado, não para preview de emote.

#### Calibrar o enquadramento

Com o menu aberto, sem reiniciar o resource:

| Comando | Efeito |
|---|---|
| `/emotepreview` | Diagnóstico completo no console (F8). |
| `/emotepreview mode <studio\|world>` | Troca de modo na hora. |
| `/emotepreview cam <x> <y> <z>` | Move a câmera em relação ao ped. |
| `/emotepreview fov <n>` | Abre ou fecha o campo de visão. |
| `/emotepreview lateral <n>` | Empurra o ped para o lado do quadro. Negativo vai para a direita. |
| `/emotepreview rot <graus>` | Gira o ped. |
| `/emotepreview tc <timecycle>` | Troca a iluminação. Sem argumento, limpa. |
| `/emotepreview dof` | Liga/desliga o desfoque de profundidade. |
| `/emotepreview daytime` | Liga/desliga a luz de dia forçada. |
| `/emotepreview replay` | Reaplica o último emote pré-visualizado. |
| `/emotepreview dump` | Imprime o bloco de config pronto para colar. |

O fluxo é: ajustar olhando na tela, rodar `dump`, copiar do F8 e colar no
`shared/config.lua`.

O diagnóstico é o que separa "a entidade sumiu" de "está viva e animando, mas
não está sendo desenhada" — dois problemas que na tela parecem o mesmo.

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

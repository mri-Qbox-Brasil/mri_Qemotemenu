---@diagnostic disable: lowercase-global

-- Shim do `Translate()` do rpemotes.
--
-- O catálogo (`data/animations.lua`) chama `Translate('smoke')` e afins em 111
-- lugares, dentro do campo `PtfxInfo` — a dica que aparece quando um emote tem
-- partícula (fumar, vomitar, soltar fogos...). Como o catálogo foi portado byte
-- a byte, essas chamadas continuam lá e precisam de um `Translate` global,
-- senão o arquivo quebra no load.
--
-- Duas particularidades que justificam a tabela embutida abaixo em vez de
-- delegar tudo ao ox_lib:
--
--   1. `PtfxInfo` é resolvido no LOAD do catálogo e o valor fica congelado na
--      tabela do emote. Se as locales do ox_lib ainda não estiverem populadas
--      nesse instante, a string errada ficaria gravada para sempre.
--   2. Os textos originais usavam códigos de cor do GTA (`~y~G~w~`), que
--      funcionavam na notificação nativa mas apareceriam literais no
--      `lib.notify`, que é NUI. Foram reescritos limpos.
--
-- Mesmo assim o ox_lib tem precedência quando a chave existe lá, para dar de
-- editar sem mexer neste arquivo.

local fallback = {
    camera        = 'Pressione G para usar o flash da câmera.',
    candle        = 'Pressione G para acender a vela.',
    cut           = 'Pressione G para cortar.',
    firework      = 'Pressione G para soltar o fogo de artifício.',
    makeitrain    = 'Pressione G para fazer chover dinheiro.',
    pee           = 'Segure G para fazer xixi.',
    poop          = 'Pressione G para fazer cocô.',
    puke          = 'Pressione G para vomitar.',
    smoke         = 'Segure G para fumar.',
    spraychamp    = 'Segure G para jogar champanhe.',
    stun          = 'Pressione G para usar a arma de choque.',
    useleafblower = 'Pressione G para usar o soprador de folhas.',
    vape          = 'Segure G para usar o vape.',
}

---@param str string
---@param ... string|number
---@return string
function Translate(str, ...)
    if type(str) ~= 'string' then return 'Unknown' end

    -- `locale()` do ox_lib devolve a própria chave quando não encontra
    -- (imports/locale/shared.lua:43), então dá para saber se resolveu.
    local ok, translated = pcall(locale, str, ...)
    if ok and translated and translated ~= str then
        return translated
    end

    local text = fallback[str]
    if not text then return str end

    if ... then
        local ok2, formatted = pcall(string.format, text, ...)
        return ok2 and formatted or text
    end

    return text
end

-- Aliases que o catálogo do rpemotes também usava.
_ = Translate

function TranslateCap(str, ...)
    return (Translate(str, ...):gsub('^%l', string.upper))
end

_U = TranslateCap

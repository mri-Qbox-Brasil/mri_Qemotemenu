-- Custom DP Loader
CustomDP = CustomDP or {}

CustomDP.Exits = CustomDP.Exits or {}

function LoadAddonEmotes()

    local prefixes = {

        Shared = '🤼 ',

        AnimalEmotes = '🐶 ',

        PropEmotes = '📦 '

    }

    assert(CustomDP ~= nil, 'Addon emotes can only be loaded once')

    for arrayName, array in pairs(CustomDP) do

        if RP[arrayName] then

            local prefix = prefixes[arrayName]

            for emoteName, emoteData in pairs(array) do

                if prefix then

                    emoteData[3] = prefix .. emoteData[3]

                end

                RP[arrayName][emoteName] = emoteData

            end

        end

    end

    -- Free memory

    CustomDP = nil

end


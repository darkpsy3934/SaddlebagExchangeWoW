-- message('Thanks for testing out Saddlebag Exchange WoW Undercut alerts! Use the commands: \n/sbex, /saddlebag or /saddlebagexchange')

SLASH_SADDLEBAG1, SLASH_SADDLEBAG2, SLASH_SADDLEBAG3 = '/sbex', '/saddlebag', '/saddlebagexchange';
local function handler(msg, editBox)
    if msg == 'help' then
        message('Go to the auction house, view your auctions and then run /sbex')
    else
        -- print("test")
        ownedAuctions=C_AuctionHouse.GetOwnedAuctions();
        print("Found", table.maxn(ownedAuctions), "active auctions.")
        if (table.maxn(ownedAuctions) > 0)
        then

            -- gets the auction id
            -- print(ownedAuctions[1]["auctionID"])

            -- doesnt work but it does show me the 
            -- print(table.concat(ownedAuctions))

            -- loop through auctions
            output = "\n"
            output = output .. "{\n"
            output = output .. '    "homeRealmName": "' .. tostring(GetRealmName()) .. '",\n'

            output = output .. '    "region": "' .. GetCurrentRegionName() .. '",\n'
            output = output .. '    "user_auctions": ['
            for k, v in pairs(ownedAuctions) do

                -- print('======')
                -- print("auction keys")
                -- for i, j in pairs(v) do
                --     print(i)
                -- end

                -- print('-----')
                -- print("itemKey info")
                -- for i, j in pairs(v["itemKey"]) do
                --     print(i)
                -- end
                -- print()
                -- print("itemID found!", v["itemKey"]["itemID"])
                -- print("price found!", v["buyoutAmount"])

                item_data = '\n        {"itemID": ' .. tostring(v["itemKey"]["itemID"]) .. ',"price": '.. tostring(v["buyoutAmount"]) .. '},'
                output = output .. item_data
            end
            output = output:sub(1, -2)
            output = output .. "\n    ]\n"
            output = output .. "}\n"
            print(output)
        else
            print("ERROR! Make sure you are at the auction house looking at your auctions before you run /sbex")
            print("{}")
        end
    end
end
SlashCmdList["SADDLEBAG"] = handler; -- Also a valid assignment strategy
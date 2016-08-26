SLASH_ARTIFACTMENU1, SLASH_ARTIFACTMENU2 = '/artifact', '/am';
SLASH_ARTIFACTMENU3 = "/artifactmenu";

local function openWeaponSockets()
    SocketInventoryItem(16);
end

-- unneeded, because artifacts are "conjoined" items
local function openOffhandSockets()
    SocketInventoryItem(17);
end

function SlashCmdList.ARTIFACTMENU(msg, editBox)
    local ARTIFACT = 6; -- http://wowprogramming.com/docs/api_types#itemQuality
    local equippedWeapon = GetInventoryItemID("player", GetInventorySlotInfo("MainHandSlot"));
    if equippedWeapon == nil then
        print("You do not have any weapons equipped.");
        return
    end
    name, link, quality, iLvl, reqLvl, class, subclass, maxStack, equipSlot, texture, vendorSellPrice = GetItemInfo(equippedWeapon);
    if quality == ARTIFACT then
        openWeaponSockets();
    else
        print("You do not have an Artifact Weapon equipped yet.");
    end
end


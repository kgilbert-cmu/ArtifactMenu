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
    -- http://wowprogramming.com/docs/api_types#itemQuality
    local QUALITY = {}
    QUALITY.POOR = 0;
    QUALITY.COMMON = 1;
    QUALITY.UNCOMMON = 2;
    QUALITY.RARE = 3;
    QUALITY.EPIC = 4;
    QUALITY.LEGENDARY = 5;
    QUALITY.ARTIFACT = 6;
    QUALITY.HEIRLOOM = 7;
    local equippedWeapon = GetInventorySlotInfo("MainHandSlot");
    if equippedWeapon == nil then
        print("You do not have any weapons equipped.");
        return
    end
    name, link, quality, iLvl, reqLvl, class, subclass, maxStack, equipSlot, texture, vendorSellPrice = GetItemInfo(equippedWeapon);
    if quality == QUALITY["ARTIFACT"] then
        openWeaponSockets();
    else
        print("You do not have an Artifact Weapon equipped yet.");
    end
end


SLASH_ARTIFACTMENU1, SLASH_ARTIFACTMENU2 = '/artifact', '/am';
SLASH_ARTIFACTMENU3 = "/artifactmenu";

local function openWeaponSockets()
    SocketInventoryItem(16);
end

function SlashCmdList.ARTIFACTMENU(msg, editBox)
    openWeaponSockets();
    print("Opening ArtifactMenu...");
end


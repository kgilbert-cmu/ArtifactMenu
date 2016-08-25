LASH_ARTIFACTMENU1, SLASH_ARTIFACTMENU2 = '/artifact', '/am';

local function openWeaponSockets()
    SocketInventoryItem(16);
end

function SlashCmdList.ARTIFACTMENU(msg, editBox)
    openWeaponSockets();
    print("Opening ArtifactMenu...");
end


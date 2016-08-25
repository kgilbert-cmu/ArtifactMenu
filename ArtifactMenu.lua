SLASH_ARTIFACTMENU1, SLASH_ARTIFACTMENU2 = '/artifact', '/am';

local function openWeaponSockets(msg, editbox)
  SocketInventoryItem(16);
end

SlashCmdList["ARTIFACTMENU"] = openWeaponSockets;
 

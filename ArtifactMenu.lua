SLASH_ARTIFACTMENU, SLASH_ARTIFACTMENUSHORT = '/artifact', '/am';
local function openWeaponSockets(msg, editbox)
  /run SocketInventoryItem(16);
end

SlashCmdList[SLASH_ARTIFACTMENU] = openWeaponSockets;
SlashCmdList[SLASH_ARTIFACTMENUSHORT] = openWeaponSockets;
 

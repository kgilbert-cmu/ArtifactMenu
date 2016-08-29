SLASH_ARTIFACTMENU1, SLASH_ARTIFACTMENU2 = '/artifact', '/am';
SLASH_ARTIFACTMENU3 = "/artifactmenu";

local ldb = LibStub:GetLibrary("LibDataBroker-1.1");

local ArtifectMenuFrame = CreateFrame("Button", "ArtifactMenuFrame", UIParent)
ArtifectMenuFrame:RegisterEvent("ADDON_LOADED")
ArtifectMenuFrame:SetScript("OnEvent", function(self) self:SetupFrame() end)

function openWeaponSockets()
    SocketInventoryItem(16);
end

-- unneeded, because artifacts are "conjoined" items
local function openOffhandSockets()
    SocketInventoryItem(17);
end

function ArtifactMenuFrame:SetupFrame()
    self:UnregisterEvent("ADDON_LOADED")
    --Frame
    self:SetWidth(32)
    self:SetHeight(32)
    self:SetPoint("CENTER",32,0)
    self:EnableMouse(true)
    self:SetMovable(true)
    self:RegisterForDrag("LeftButton")
    self:RegisterForClicks("AnyUp")
    self:SetScript("OnDragStart", function(s) s:StartMoving() end)
    self:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end)
    --Set Texture
    self.tex = self:CreateTexture(nil, "BACKGROUND")
    self.tex:SetAllPoints(self)
    self.leftGradiant = self:CreateTexture(nil, "BORDER")
    self.leftGradiant:SetWidth(16)
    self.leftGradiant:SetHeight(14)
    self.leftGradiant:SetPoint("LEFT", 0, -5)
    self.leftGradiant:SetTexture(1,0,0,1)
    self.leftGradiant:SetGradientAlpha("Horizontal", 0, 0, 0, 0.2, 0, 0, 0, 1)
    self.rightGradiant = self:CreateTexture(nil, "BORDER")
    self.rightGradiant:SetWidth(16)
    self.rightGradiant:SetHeight(14)
    self.rightGradiant:SetPoint("RIGHT", 0, -5)
    self.rightGradiant:SetTexture(1,0,0,1)
    self.rightGradiant:SetGradientAlpha("Horizontal", 0, 0, 0, 1, 0, 0, 0, 0.2)
    self.text = self:CreateFontString(nil, "ARTWORK", "GameFontWhite")
    self.text:SetJustifyH("CENTER")
    self.text:SetText("0")
    self.text:SetWidth(40)
    self.text:SetHeight(14)
    self.text:SetPoint("CENTER", 0, -5)
    self.text:SetNonSpaceWrap(false)
    self.menu = CreateFrame("Frame","ArtifactMenuFrameMenu", self, "UIDropDownMenuTemplate", 1)
    self.menuOnLoad = menuOnLoad
    UIDropDownMenu_Initialize(self.menu, self.menuOnLoad, "MENU")
    self:SetScript("OnClick",
        function(s,button,down)
            s:OnClick(button,down)
        end)
    self.dataBroker = ldb:NewDataObject("ArtifactMenu", {
        type = "data source",
        text = "",
        value = "",
        label = "ArtifactMenu",
        OnClick = function (clickedframe, button, down)
            ArtifactMenuFrame:OnClick(button, down, clickedframe)
        end
    })
end

function ArtifactMenuFrame:OnClick(button, down, anchorFrame)
    self.menu.button = button
    anchorFrame = anchorFrame or self
    self.anchorFrame = anchorFrame
    if button == "LeftButton" then
        openArtifactMenu();
    end
end

function openArtifactMenu()
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

function SlashCmdList.ARTIFACTMENU(msg, editBox)
    openArtifactMenu();
end


-- Marmaites and my edit here test

MyAddonData = MyAddonData or {
	[1] = "test"
}
local playerName = UnitName("player")
ChatFrame1:AddMessage('Hi my name is: ' .. playerName .. " my level is " .. UnitLevel("player")+1) 

function MAOnLoad()
MAEventHandlers = {
		ADDON_LOADED = 	{f=MAAddonLoaded}, 
		PLAYER_TARGET_CHANGED = {f=MAPlayerTargetChanged}
		}

		this:RegisterEvent("ADDON_LOADED")
		this:RegisterEvent("PLAYER_TARGET_CHANGED")
end

function MAOnEvent()
	MAEventHandlers[event].f()
end

function MAAddonLoaded()
	MyAddonData = MyAddonData or {}
	ChatFrame1:AddMessage(MyAddonData[1])
end

function MAPlayerTargetChanged()
	SetMapToCurrentZone()
   	posx, posy = GetPlayerMapPosition("player")
   	ChatFrame1:AddMessage(posx)
   	ChatFrame1:AddMessage(posy)
   	ChatFrame1:AddMessage(UnitName("target"))
   	ChatFrame1:AddMessage(UnitLevel("target"))
   	MyAddonData = UnitName("target")
end


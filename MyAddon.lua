-- Marmaites and my edit here
local playerName = UnitName("player")
ChatFrame1:AddMessage('Hi my name is: ' .. playerName .. " my level is " .. UnitLevel("player")+1) 
function MAOnLoad()
MAEventHandlers = {VARIABLES_LOADED = {f=MAVariablesLoaded}, PLAYER_TARGET_CHANGED = {f=MAPlayerTargetChanged},}
		this:RegisterEvent("VARIABLES_LOADED")
		this:RegisterEvent("PLAYER_TARGET_CHANGED")
end

function MAOnEvent()
	MAEventHandlers[event].f()
	if event == PLAYER_LOGOUT then
	end

end

function MAVariablesLoaded()
	MyAddonData = MyAddonData or {}
	ChatFrame1:AddMessage(MyAddonData)
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


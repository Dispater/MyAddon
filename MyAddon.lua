-- Marmaites and my edit here test

-- MyAddonData = {}

	MyAddonData = MyAddonData or {
	[1] = "| UnitName | UnitLevel | UnitHealthMax | UnitCreatureType | UnitDamage | UnitRangedDamage | UnitReaction | posx | posy"
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
-- 	MyAddonData = MyAddonData or {
-- 	[1] = "UnitName | UnitLevel | UnitHealthMax | UnitCreatureType | UnitDamage | UnitRangedDamage | UnitReaction | posx | posy"
-- }
	ChatFrame1:AddMessage(MyAddonData[1])
end

function MAPlayerTargetChanged()
	if UnitName("target") ~= nil then 
	SetMapToCurrentZone()
   	posx, posy = GetPlayerMapPosition("player")
   	local index = UnitName("target") .. math.random(1,1000000000) 
   	ChatFrame1:AddMessage(index)
   	ChatFrame1:AddMessage(posy)
   	ChatFrame1:AddMessage(UnitName("target"))
   	ChatFrame1:AddMessage(UnitLevel("target"))
   	MyAddonData[index] = "|" .. UnitName("target") .. "|" .. UnitLevel("target") .. "|" .. UnitHealthMax("target") .. "|" .. UnitCreatureType("target") .. "|" .. UnitDamage("target") .. "|" .. UnitRangedDamage("target") .. "|" .. UnitReaction("target","player") .. "|" .. posx .. "|" .. posy 
   else
   end
end


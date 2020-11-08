addEvent("robHouse",true)
addEventHandler("robHouse",root, function (player,intid)
	--local intid = 14
	if player and intid then
		factionID = getElementData	(player,"faction")
		if factionID then
			if exports.factions:getFactionType(factionID) == 0 then --HANYA UNTUK GANG
				triggerClientEvent(player,"tryingRobHouse",player,player,intid)
			else
				outputChatBox("Jums jābūt bandā lai veiktu tādas darbības",player)
			end
		else
			outputChatBox("Jūs neesat nevienā frakcijā, jums jābūt bandā lai laupītu īpašumus",player)
		end
	end
end)

addEvent("finishedRobbing",true)
addEventHandler("finishedRobbing",root, function (player,intid)
	if player and intid then
		local success = math.random(1,2)
		local police = math.random(1,3)
		if success == 1 then -- izdodas atlauzt
			outputChatBox("Tu atlauzi vaļā durvis",player)
			if police == 1 then
				outputChatBox("Signalizācija ir sākusi skanēt! Tev nav daudz laiks pirms ieradīsies policija",player)
				triggerCops()
			elseif police == 2 then
				outputChatBox("Mājā izrādijās novērošanas kameras, tava seja ir piefiksēta!",player)
			else
				outputChatBox("Signalizācija nav sākusi skanēt",player)
			end
		end
		if success == 2 then
			outputChatBox("Tev neizdevās atlauzt vaļā durvis",player)
			if police == 1 then
				outputChatBox("Signalizācija ir sākusi skanēt! Tev nav daudz laika pirms ieradīsies policija!",player)
				triggerCops()
			else 
				outputChatBox("Signalizācija nav sākusi skanēt",player)
			end
		end

	end
end)
	
	

function triggerCops()
	local theTeam = getTeamFromName("Los Santos Police Departament")
		local teamPlayers = getPlayersInTeam(theTeam)
		for key, value in ipairs(teamPlayers) do
		local duty = tonumber(getElementData(value, "duty"))
			if (duty>0) then
			--	outputChatBox("[RADIO] Visām vienībām, " .. areaName .. ".", value, 255, 194, 14)
			--	outputChatBox("[RADIO] Vehicle was a ", value, 255, 194, 14)
			--	outputChatBox("[RADIO] The plate is '"..  getVehiclePlateText ( theVehicle ) .."' and heading " .. direction .. ".", value, 255, 194, 14)
			end
		end
end
function convertServerTickToTimeStamp(tick) return getRealTime().timestamp+((getTickCount()*0.001)-(tick*0.001)); end
	
function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end
function formatMilliseconds(milliseconds) 
    local totalseconds = math.floor( milliseconds / 1000 ) 
    milliseconds = milliseconds % 1000 
    local seconds = totalseconds % 60 
    local minutes = math.floor( totalseconds / 60 ) 
    local hours = math.floor( minutes / 60 ) 
    local days = math.floor( hours / 24 ) 
    minutes = minutes % 60 
    hours = hours % 24 
    return string.format( "%02d:%02d", hours, minutes )   
end 
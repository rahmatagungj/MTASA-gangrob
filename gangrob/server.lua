addEvent("areYouFromGang",true)
addEventHandler("areYouFromGang",root,function(player)
		if player then
			factionID = getElementData(player,"faction")
			if factionID then
				if exports.factions:getFactionType(factionID) == 0 then
					triggerClientEvent(client, "sendBackGang", resourceRoot, true) 
					outputDebugString("true gang sht works")
				else
					triggerClientEvent(client, "sendBackGang", resourceRoot, false) 
				end
			end
		end
	end)


addEvent("robHouse",true)
function robbing(player,intid)
	--local intid = 14
	outputDebugString("test")
	if player and intid then
		factionID = getElementData	(player,"faction")
		if factionID then
			if exports.factions:getFactionType(factionID) == 0 then
				triggerClientEvent(player,"tryingRobHouse",player,player,intid)
			else
				outputChatBox("kamu harus menjadi anggota geng untuk melakukan rob toko",player)
			end
		else
			outputChatBox("kamu bukan anggota geng mana pun, kamu harus tergabung dalam geng untuk melakukan rob toko",player)
		end
	end
end
--addCommandHandler("robhouse",robbing)
addEventHandler("robHouse",root,robbing)

function finishRob(player,intid)
	if player and intid then
		local success = math.random(1,2)
		local police = math.random(1,3)
		if success == 1 then -- izdodas atlauzt
			outputChatBox("kamu masuk kedalam toko",player)
			if police == 1 then
				outputChatBox("Alarm peringatan berbunyi! kamu tidak punya banyak waktu sebelum polisi tiba",player)
				triggerCops()
			elseif police == 2 then
				outputChatBox("Kamera CCTV sudah memantau, wajah kamu sudah terdeteksi!",player)
			else
				outputChatBox("Alarm belum berbunyi",player)
			end
		end
		if success == 2 then
			outputChatBox("kamu gagal membuka pintu",player)
			if police == 1 then
				outputChatBox("Alarm peringatan berbunyi! kamu tidak punya banyak waktu sebelum polisi tiba!",player)
				triggerCops()
			else 
				outputChatBox("Alarm belum berbunyi",player)
			end
		end

	end
end
	addEvent("finishedRobbing",true)
	addEventHandler("finishedRobbing",root,finishRob)

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
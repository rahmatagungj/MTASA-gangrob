addEvent("robHouse",true)
addEventHandler("robHouse",root, function (player,intid)
	local theTeam = exports.pool:getElement("team", 1)
	local theTeamName = getTeamName(theTeam)
	local teamPlayers = getPlayersInTeam(theTeam)
	if #teamPlayers == 1 then
		print("TIDAK DAPAT MELAKUKAN ROB KARENA TIDAK ADA POLISI ONLINE")
		return
	end

	if player and intid then
		factionID = getElementData	(player,"faction")
		if factionID then
			if exports.factions:getFactionType(factionID) == 0 then --HANYA UNTUK GANG
				triggerClientEvent(player,"tryingRobHouse",player,player,intid)
			else
				outputChatBox("kamu harus menjadi anggota geng untuk melakukan rob toko",player)
			end
		else
			outputChatBox("kamu bukan anggota geng mana pun, kamu harus tergabung dalam geng untuk melakukan rob toko",player)
		end
	end
end)

function tes(player,intid) 
	triggerEvent("robHouse",player,player,intid)
end
addCommandHandler("rob",tes)

addEvent("finishedRobbing",true)
addEventHandler("finishedRobbing",root, function (player,intid)
	if player and intid then
		local success = math.random(1,1)
		local police = math.random(1,2)
		if success == 1 then 
			-- giving money
			if exports.global:giveMoney(source,uangRampok) then
				local UANG_RAMPOK = exports.global:formatMoney(uangRampok)
				outputChatBox("Selamat kamu mendapatkan uang senilai Rp. ".. THE_NEW .."",source,255,255,255)
				--triggerClientEvent(source,"overlay:create:topright",source,"INFO","kamu mendapatkan hasil rampokan senilai Rp. ".. UANG_RAMPOK .."",6000,true,false,"info",false)
			end 

			setTimer(function()
				if police == 1 then
					outputChatBox("Alarm peringatan berbunyi! kamu tidak punya banyak waktu sebelum polisi tiba",player)
					triggerCops()
				else
					outputChatBox("Alarm belum berbunyi",player)
					setTimer(function()
						outputChatBox("Alarm peringatan berbunyi! kamu tidak punya banyak waktu sebelum polisi tiba",player)
						triggerCops()
					end,5000,1,player)
				end
			end,5000,1,player)
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
end)
	
	

function triggerCops()
	--[[local theTeam = getTeamFromName("Kepolisian Republic City")
		local teamPlayers = getPlayersInTeam(theTeam)
		for key, value in ipairs(teamPlayers) do
		local duty = tonumber(getElementData(value, "duty"))
			if (duty>0) then
			--outputChatBox("[RADIO] Untuk semua unit, " .. areaName .. ".", value, 255, 194, 14)
			--outputChatBox("[RADIO] Vehicle was a ", value, 255, 194, 14)
			--outputChatBox("[RADIO] The plate is '"..  getVehiclePlateText ( theVehicle ) .."' and heading " .. direction .. ".", value, 255, 194, 14)
			end
		end]]
		print("polisi datang")
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

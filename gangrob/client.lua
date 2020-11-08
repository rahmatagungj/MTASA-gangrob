local x,y = guiGetScreenSize()
players = nil
newintid = nil
local loadingWidth = 0
local renderLoading = false

addEvent("tryingRobHouse",true)
addEventHandler("tryingRobHouse",root,function (player,intid)  
	players = player
	newintid = intid	
	-- MAKE LOADING BAR
	loadingWidth = 0
	renderLoading = true
end)

function drawLoading()
	if renderLoading then
		dxDrawRectangle(sx/2-380/2,sy-100, 390, 15, tocolor(0,0,0,200))
		if loadingWidth < 390 then
			loadingWidth = loadingWidth + 0.43
			dxDrawRectangle(sx/2-380/2,sy-100, loadingWidth, 15, tocolor(124, 197, 118,200))
		elseif loadingWidth >= 390 then
			renderLoading = false
			loadingWidth = 0
			triggerServerEvent("finishedRobbing",players,players,newintid)
		end
	end
end
addEventHandler("onClientRender", getRootElement(), drawLoading)

if fileExists("client.lua") then 
	fileDelete("client.lua")
end
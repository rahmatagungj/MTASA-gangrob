loadstring(exports.dgs:dgsImportFunction())()
local x,y = guiGetScreenSize()
players = nil
newintid = nil
addEvent("tryingRobHouse",true)
function clientRob(player,intid)
	text = dgsCreateLabel((x/2)-158, y-230,317,43,"Notiek uzlaušana",false)
	progressbar = dgsCreateProgressBar((x/2)-158, y-200, 317, 43, false)    
	number = 0 
	players = player
	newintid = intid
	 timer = setTimer(theTimer,60,0)
end
	addEventHandler("tryingRobHouse",root,clientRob)

	function theTimer()
		number = number + 1 
			dgsProgressBarSetProgress(progressbar,number)
			if number == 100 then
				destroyElement(progressbar)
				destroyElement(text)
				killTimer(timer)
				triggerServerEvent("finishedRobbing",players,players,newintid)
			end 
	end
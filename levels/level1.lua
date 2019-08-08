suit = require 'levels.suit'
local chk = {checked = false, text = "Are you a human?"}
local submitButton = {"Submit"}

function updateLevel1()
	win = false
	submitted = false

	suit.layout:reset(window.x+50,window.y+200, 20,20)
	
	suit.Checkbox(chk,suit.layout:row(500,50))
	suit.layout:row(500,50)
	if suit.Button(submitButton,suit.layout:row(500,50)).hit and chk.checked then
		gamestate = "win"
	end

end

function drawLevel1()
	love.graphics.draw(dialogWindow,window.x,window.y,rotation, scalex, scaley, offsetx, offsety)
	suit.draw()
	
end
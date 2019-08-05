suit = require 'levels.suit'


local win = false
local submitted = false
local chk = {checked = false, text = "Are you a human?"}
local submitButton = {"Submit"}

function updateLevel1()

	suit.layout:reset(100,100, 20,20)
	--suit.Checkbox(chk, {align='right'}, suit.layout:row())
	suit.Checkbox(chk,0,0,500,50)
	if suit.Button(submitButton, 100, 100, 500, 50).hit and chk.checked then
		win = true
	end


    if win then
		gamestate = "win"
    end
end

function drawLevel1()
	suit.draw()
end
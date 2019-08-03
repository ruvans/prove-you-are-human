suit = require 'levels.suit'


local boxChecked = false
local chk = {checked = false, text = "Are you a human?"}

function updateLevel1()

	suit.layout:reset(100,100, 20,20)
	--suit.Checkbox(chk, {align='right'}, suit.layout:row())
	suit.Checkbox(chk,0,0,500,50)
    -- if the button was pressed at least one time, but a label below
    if boxChecked then
        suit.Label("Good. Welcome", 100,150, 300,30)
    end
end

function drawLevel1()
	suit.draw()
end
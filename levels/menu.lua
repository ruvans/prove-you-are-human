suit = require 'levels.suit'

local playHit = false

function updateMenu()
	--game title
	suit.Label("Prove you are human", 70,50,window.width,50)
	
	-- Put a button on the screen. If hit, show a message.
    if suit.Button("Start", 250,400, 300,50).hit then
        playHit = true
    end

	--start level 1 when play is clicked
    if playHit then
		gamestate = "1"
    end
end

function drawMenu()
	suit.draw()
end

function updateWinScreen()
	suit.Label("you win", 100,150, 300,30)
end

function drawWinScreen()
	suit.draw()
end


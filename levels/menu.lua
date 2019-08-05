suit = require 'levels.suit'


function updateMenu()
	--game title
	suit.Label("Prove you are human", 70,50,window.width,50)

	-- put the layout origin at position (300,300)
    -- also set cell padding to 20 pixels to the right and to the bottom
    suit.layout:reset(300,300, 20,20)
	
	-- Put a button on the screen. If hit, show a message.
    if suit.Button("Start",suit.layout:row(200,50)).hit then
        gamestate = "1"
    end
	
	if suit.Button("Quit", suit.layout:row(200, 50)).hit then
		love.window.close()
	end


end

function drawMenu()
	suit.draw()
end

function updateWinScreen()
	suit.Label("you win", 100,150, 300,30)
	
	if suit.Button("Return to menu", 100, 400, 500, 50).hit then
		gamestate = "menu"
	end
end

function drawWinScreen()
	suit.draw()
end


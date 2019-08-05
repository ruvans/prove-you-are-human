require("levels.menu")
local level1 = require("levels.level1")

checkbox = {}
window = {}
gamestate = "menu"

function love.load()

	local myfont = love.graphics.newFont(45)
	love.graphics.setFont(myfont)
	--love.graphics.setColor(0,153,0,225)
	--love.graphics.setBackgroundColor(0,0,0)
	
	printx = 0
	printy = 0
	
	windowUnchecked = love.graphics.newImage('assets/lv1_window001.png')
	windowChecked = love.graphics.newImage('assets/lv1_window002.png')
	
	checkbox.x = 180
	checkbox.y = 245
	checkbox.size = 30
	
	window.x = 0
	window.y = 0
	window.width = 625
	window.barHeight = 50
	window.height = 420
	
	drawChecked = false
	mouseDownOnWindowBar = false
end

function love.update()
	if gamestate == "menu" then
		updateMenu()
	end
	if gamestate == "1" then
		updateLevel1()
	end
	if gamestate == "win" then
		updateWinScreen()
	end
end

function love.draw()

	rotation = 0
	scalex = 1
	scaley = 1
	offsetx = 0
	offsety = 0
	
	--drawLevel1()
	if gamestate == "menu" then
		drawMenu()
	end
	if gamestate == "1" then
		drawLevel1()
	end
	
	if gamestate == "win" then
		drawWinScreen()
	end
	--if drawChecked then
	--	love.graphics.draw(windowChecked,window.x,window.y,rotation, scalex, scaley, offsetx, offsety)
	--else
	--	love.graphics.draw(windowUnchecked,window.x,window.y,rotation, scalex, scaley, offsetx, offsety)
	--end
	

	--love.graphics.rectangle("line", window.x + checkbox.x, window.y + checkbox.y, checkbox.size, checkbox.size)
	--love.graphics.rectangle("line", window.x, window.y, window.width, window.barHeight)
	
end

function toggleCheckbox()
	if drawChecked == true then
		drawChecked = false
	else
		drawChecked = true
	end
end

function seeIfBoxChecked(x, y)
	xIn = false
	yIn = false
	if x > window.x + checkbox.x and x < window.x + checkbox.x + checkbox.size then
		xIn = true
	end
	
	if y > window.y + checkbox.y and y < window.y + checkbox.y + checkbox.size then
		yIn = true
	end
	
	if xIn == true and yIn == true then
		toggleCheckbox()
	end
end

function seeIfWindowBarClicked(x, y)
	xIn = false
	yIn = false
	if x > window.x and x < window.x + window.width then
		xIn = true
	end
	
	if y > window.y and y < window.y + window.barHeight then
		yIn = true
	end
	
	if xIn == true and yIn == true then
		mouseDownOnWindowBar = true
	else
		mouseDownOnWindowBar = false
	end
end

function love.mousepressed(x, y, button, istouch)
	seeIfBoxChecked(x, y)
	seeIfWindowBarClicked(x, y)
end

function love.mousemoved( x, y, dx, dy, istouch )
	if mouseDownOnWindowBar == true then
		window.x = window.x + dx
		window.y = window.y + dy
		
		-- dont let the window go out of bounds though!
		if window.x < 0 then
			window.x = 0
		elseif window.x + window.width > 800 then
			window.x = 800 - window.width
		end
		
		if window.y < 0 then
			window.y = 0
		elseif window.y + window.height > 600 then
			window.y = 600 - window.height
		end
	end
end

function love.mousereleased( x, y, button, istouch, presses )
	mouseDownOnWindowBar = false
end

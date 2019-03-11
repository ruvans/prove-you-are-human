
checkbox = {}

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
	
	drawChecked = false
end

function love.update()
end

function love.draw()
	--love.graphics.print('Hello World!', 200, 200)
	--love.graphics.print('Text', printx, printy)
	
	x = 0
	y = 0
	rotation = 0
	scalex = 1
	scaley = 1
	offsetx = 0
	offsety = 0
	
	if drawChecked then
		love.graphics.draw(windowChecked,x,y,rotation, scalex, scaley, offsetx, offsety)
	else
		love.graphics.draw(windowUnchecked,x,y,rotation, scalex, scaley, offsetx, offsety)
	end
	

	love.graphics.rectangle("line",checkbox.x, checkbox.y, checkbox.size, checkbox.size)
	
end

function toggleCheckbox()
	if drawChecked == true then
		drawChecked = false
	else
		drawChecked = true
	end
end

function love.mousepressed(x, y, button, istouch)
	xIn = false
	yIn = false
	if x > checkbox.x and x < checkbox.x + checkbox.size then
		xIn = true
	end
	
	if y > checkbox.y and x < checkbox.y + checkbox.size then
		yIn = true
	end
	
	if xIn == true and yIn == true then
		toggleCheckbox()
	end
end

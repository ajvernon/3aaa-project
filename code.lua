--[[ 
-- this is my game pls r8 8/8 m8
--]]--

-- player data
player1=
{
    -- player position and movement data
    xPos = 72,
    yPos = 16,
    xChange = 0,
    yChange = 0,
    facing = "right",
    onGround = false,
    jumpSpeed = 5.0,
}

-- various globals
g =
{
    gravity = .3,
}

-- loads the scenes code - commented out as it doesn't work yet
-- LoadScript("scenes.lua")

function Init()
	BackgroundColor(1)
	DrawTilemap()
	--PlaySong(false)
end

function Update(deltaTime)
    local startX = player1.xPos

    -- Initial Y axis movement!
    if Button(0)
        and player1.onGround == true then
            player1.yChange=-player1.jumpSpeed
    end

    -- Movement on the X axis!

    player1.xChange = 0
    if Button(2) then
        player1.xChange = -1
        player1.facing = "left"
    end
    
    if Button(3) then
        player1.xChange = 1
        player1.facing = "right"
    end

    player1.xPos = player1.xPos + player1.xChange
   
    -- Collision on the X axis!
    
    local xOffset =0
    if player1.xChange > 0 then xOffset = 7 end

    if Flag((player1.xPos+xOffset)/8, (player1.yPos+7)/8) == 0 then
        player1.xPos = startX
    end

    -- Movement on the Y axis!
    player1.yChange = player1.yChange + g.gravity
    player1.yPos = player1.yPos + player1.yChange

    player1.onGround = false

    -- Collision on the Y axis!
    if player1.yChange >= 0 then
        flagCheck = Flag((player1.xPos+4)/8,(player1.yPos+8)/8)
        yPosChange = player1.yPos
    elseif player1.yChange < 0 then
        flagCheck = Flag((player1.xPos+4)/8,(player1.yPos)/8)
        yPosChange = player1.yPos +8
    end

    if flagCheck == 0 then
        player1.yPos = math.floor(yPosChange/8)*8
        if player1.yChange >= 0 then player1.onGround = true end
        if player1.yChange < 0 then player1.onGround = false end
        player1.yChange = 0
    end
end

function Draw()
    RedrawDisplay()
	DrawSprite(1,player1.xPos,player1.yPos,false,false,true,0)--draw player
end

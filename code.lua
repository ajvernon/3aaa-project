--[[ 
-- this is my game pls r8 8/8 m8
--]]--

player1=
{
    -- player position and movement data
    xPos = 72,
    yPos = 16,
    xChange = 0,
    yChange = 0,
    onGround = false,
    jumpSpeed = 3.0,
}

function Init()
	BackgroundColor(0)
	DrawTilemap()
	--PlaySong(false)
end

function Update(deltaTime)
    local startX = player1.xPos
    
    -- Initial Y axis movement!
    if Button(4)
        and player1.onGround == true then
            player1.yChange=-player1.jumpSpeed
    end

    -- Movement on the X axis!

    player1.xChange = 0
    if Button(2) then
        player1.xChange = -1
    end
    
    if Button(3) then
        player1.xChange = 1
    end

    player1.xPos = player1.xPos + player1.xChange
   
    -- Collision on the X axis!
    
    local xOffset =0
    if player1.xChange > 0 then xOffset = 7 end

    if Flag((player1.xPos+xOffset)/8, (player1.yPos+7)/8) == 0 then
        player1.xPos = startX
    end
end

function Draw()
    RedrawDisplay()
	DrawSprite(1,player1.xPos,player1.yPos,false,false,true,0)--draw player
end

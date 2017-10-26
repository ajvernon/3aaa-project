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
    onGround = true,
    jumpSpeed = 3.0,
}

function Init()
	BackgroundColor(0)
	DrawTilemap()
	--PlaySong(false)
end

function Update(deltaTime)
    
end

function Draw()
    RedrawDisplay()
	DrawSprite(1,player1.xPos,player1.yPos,false,false,true,0)--draw player
end

-- scenes, these are either the level or menu screens
scene = {
    playerEnabled = true,
    size={x=256,y=240},
    tilemapArea{x=0,y=0},
}

function scene:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

screenScene = scene:new{screenType=""}

menuScreen = screenScene:new{screenType="menu"}
pauseScreen = screenScene:new{screenType="pause"}

levelScene = scene:new{}

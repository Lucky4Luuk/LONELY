local lonely = require("lonely.lonely")

local scene = Scene:create()
local camera = Camera:create()
scene:add_camera(camera, true)

function love.draw()
  scene:render()
end

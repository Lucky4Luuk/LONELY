local lib = {}

Camera = {}
Camera.__index = Camera

function Camera:create()
  local camera = {}
  setmetatable(camera, Camera)

  return camera
end

function Camera.render_to(self, canvas)
  
end

return lib

Camera = {}
Camera.__index = Camera

function Camera:create(renderTarget, useRenderTarget, shader)
  local camera =  {
                    renderTarget=renderTarget or nil,
                    useRenderTarget=useRenderTarget or false,
                    shader=shader or love.graphics.newShader("lonely/assets/default_shader.glsl"),
                    position=vec3(0,0,0),
                    direction=vec3(0,0,1),
                    roll=0
                  }
  setmetatable(camera, Camera)

  return camera
end

function Camera.render(self)
  local w = love.graphics.getWidth()
  local h = love.graphics.getHeight()

  if self.useRenderTarget and self.renderTarget then
    love.graphics.setCanvas(self.renderTarget)
    w = self.renderTarget:getWidth()
    h = self.renderTarget:getHeight()
  end

  --Render
  shaderHandler.try_send(self.shader, "camera.position", self.position)
  shaderHandler.try_send(self.shader, "camera.direction", self.direction)
  shaderHandler.try_send(self.shader, "camera.roll", self.roll)
  love.graphics.setShader(self.shader)
  love.graphics.rectangle("fill", 0,0, w,h)
  love.graphics.setShader()

  --Unset the canvas
  love.graphics.setCanvas()
end

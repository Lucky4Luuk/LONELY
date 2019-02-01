Scene = {}
Scene.__index = Scene

function Scene:create()
  local scene = {objects={}, cameras={}, activeCamera=0}
  setmetatable(scene, Scene)

  return scene
end

function Scene.add_camera(self, camera, active)
  table.insert(self.cameras, camera)
  if active then
    self.activeCamera = #self.cameras
  end
end

function Scene.add_object(self, sdf)
  table.insert(self.objects, sdf)
end

function Scene.render(self)
  if self.activeCamera > 0 then
    if self.cameras[self.activeCamera] then
      self.cameras[self.activeCamera]:render()
    end
  end
end

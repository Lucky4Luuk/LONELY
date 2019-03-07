local lib = {}

function lib.try_send(shader, name, value)
  if shader:hasUniform(name) then
    shader:send(name, value)
  end
end

return lib

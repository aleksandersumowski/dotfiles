local M = {}
M.members = function(t)
  for k,v in pairs(t) do
    print(k .. ": " .. tostring(v))
  end
end

return M


local __modules = {}
local require = function(path)
    local module = __modules[path]
    if module ~= nil then
        if not module.inited then
            module.cached = module.loader()
            module.inited = true
        end
        return module.cached
    else
        error("module not found")
        return nil
    end
end

----------------
__modules["main"] = { inited = false, cached = false, loader = function(...)
---- START main.lua ----
local mod = require("mod")
mod.foo("Bar")
sleep(1)
term.clear()
print("Yup hacking")

---- END main.lua ----
 end}
----------------
__modules["mod"] = { inited = false, cached = false, loader = function(...)
---- START mod.lua ----
local mod = {}

function mod.foo(bar)
    print("Foo the bar", bar)
end


return mod
---- END mod.lua ----
 end}
__modules["main"].loader()
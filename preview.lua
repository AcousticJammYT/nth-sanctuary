local preview = {}
local flag 
local path = "saves/nth_sanctum/file_1.json"
if love.filesystem.getInfo(path) then
    data = JSON.decode(love.filesystem.read(path))
    flag = data.flags["prog"]
end

-- whether to fade out the default background
preview.hide_background = true

function preview:init(mod, button)
    self.mod_id = mod.id
    self.base_path = mod.path.."/preview"
    local function p(f) return self.base_path .. "/" .. f end
    if flag then
        print("What")
        print(self.music)
        mod.preview_music_path = p("prev2.mp3")
    end
    -- code here gets called when the mods are loaded
    --self.particles = {}
    --self.particle_timer = 0
end

function preview:update()
    -- code here gets called every frame, before any draws
    -- to only update while the mod is selected, check self.selected (or self.fade)

end

function preview:draw()
    -- code here gets drawn to the background every frame!!
    -- make sure to check  self.fade  or  self.selected  here

end

function preview:drawOverlay()
    -- code here gets drawn above the menu every frame
    -- so u can make cool effects
    -- if u want
end

return preview
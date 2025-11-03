local ComplexSoundUpdater, super = Class(Object)

function ComplexSoundUpdater:init(arg1,arg2,arg3)
    super.init(self)
    self.complexsnd = ComplexSound(arg1 or 0,arg2 or 0,arg3 or -1)
end

function ComplexSoundUpdater:update()
    super.update(self)

    self.complexsnd:update()
end

return ComplexSoundUpdater
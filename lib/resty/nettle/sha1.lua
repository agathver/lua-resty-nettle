local types        = require "resty.nettle.types.common"
local context      = require "resty.nettle.types.sha1"
local lib          = require "resty.nettle.library"
local ffi          = require "ffi"
local ffi_new      = ffi.new
local ffi_str      = ffi.string
local setmetatable = setmetatable

local sha1 = setmetatable({}, {
    __call = function(_, data, len)
        local context = ffi_new(context)
        lib.nettle_sha1_init(context)
        lib.nettle_sha1_update(context, len or #data, data)
        lib.nettle_sha1_digest(context, 20, types.uint8_t_160)
        return ffi_str(types.uint8_t_160, 20)
    end
})
sha1.__index = sha1

function sha1.new()
    local self = setmetatable({ context = ffi_new(context) }, sha1)
    lib.nettle_sha1_init(self.context)
    return self
end

function sha1:update(data, len)
    return lib.nettle_sha1_update(self.context, len or #data, data)
end

function sha1:digest()
    lib.nettle_sha1_digest(self.context, 20, types.uint8_t_160)
    return ffi_str(types.uint8_t_160, 20)
end

return sha1

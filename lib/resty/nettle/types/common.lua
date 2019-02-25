local ffi        = require "ffi"
local ffi_new    = ffi.new
local ffi_typeof = ffi.typeof

local size_t

local types = {
    size_t  = ffi_typeof "size_t[?]",
    uint8_t = ffi_typeof "uint8_t[?]",
    char    = ffi_typeof "char[?]",
}

return {
    size_t      = types.size_t,
    size_t_8    = ffi_new(types.size_t,  1),
    uint8_t     = types.uint8_t,
    uint8_t_8   = ffi_new(types.uint8_t, 1),
    uint8_t_16  = ffi_new(types.uint8_t, 2),
    uint8_t_32  = ffi_new(types.uint8_t, 4),
    uint8_t_64  = ffi_new(types.uint8_t, 8),
    uint8_t_96  = ffi_new(types.uint8_t, 12),
    uint8_t_128 = ffi_new(types.uint8_t, 16),
    uint8_t_160 = ffi_new(types.uint8_t, 20),
    uint8_t_192 = ffi_new(types.uint8_t, 24),
    uint8_t_224 = ffi_new(types.uint8_t, 28),
    uint8_t_256 = ffi_new(types.uint8_t, 32),
    uint8_t_384 = ffi_new(types.uint8_t, 48),
    uint8_t_512 = ffi_new(types.uint8_t, 64),
    char        = types.char,
    char_16     = ffi_new(types.char,    2),
    char_24     = ffi_new(types.char,    3),
}

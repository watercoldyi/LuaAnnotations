---@meta

local M = {}

--- debug级别日志
---@param fmt string
---@param ... any
function M.debug(fmt,...) end

--- info级别日志
---@param fmt string
---@param ... any
function M.info(fmt,...) end

--- warn级别日志
---@param fmt string
---@param ... any
function M.warn(fmt,...) end

--- error级别日志
---@param fmt string
---@param ... any
function M.error(fmt,...) end

--- fatal级别日志
---@param fmt string
---@param ... any
function M.fatal(fmt,...) end

---@alias hlog_set_what
---| "file"
---| "color"
---| "fsync"
---| "level"

--- 配置日志信息
---@param what hlog_set_what
---@param v any 值,根据what有如下类型
---     file => string
---     color => bool
---     fsync => bool
---     level => integer
function M.set(what,v) end

return M
---@meta

local llthreads2 = {}

---@class llThread
local thread = {}

---@param start_detached boolean
---@param joinable boolean
---@return llThread "this"
function thread:start(start_detached,joinable) end

function thread:join() end

---@return boolean
function thread:started() end

---@return boolean
function thread:detached() end

---@return boolean
function thread:joinable() end

function thread:interrupt() end

--- 创建一个OS线程
---@param code string 线程函数的lua源码
---@param ... any 传给
---@return llThread
function llthreads2.new(code,...) end

--- 设置日志方法
---@param f function
function llthreads2.set_logger(f) end

---@return string
function llthreads2.version() end

return llthreads2
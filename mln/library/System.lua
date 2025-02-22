---@meta

System = {}

---@return string
function System:OSVersion()
end

---@return string
function System:AppVersion()
end

---@return string
function System:SDKVersion()
end

---@return integer
function System:SDKVersionInt()
end

---@return boolean
function System:iOS() end

---@return boolean
function System:Android() end

--- 在主线程下次渲染前执行操作
---@param cb function
function System:asyncDoInMain(cb) end

---@return MLNSize
function System:screenSize() end

--- 获取当前设备的像素缩放比
---@return number
function System:scale() end

--- 获取设备信息, 如iPhone10,3
---@return string
function System:deviceInfo() end

--- 延迟执行任务
---@param cb function
---@param delay number
function System:setTimeOut(cb,delay) end

--- 显示状态栏
function System:showStatusBar() end

--- 隐藏状态栏
function System:hideStatusBar() end

--- 设置屏幕亮度
---@param brightness number [1-255]
function System:changeBright(brightness) end

--- 获取屏幕亮度
---@return number
function System:getBright() end
---@class MLNColor
local M = {}

--- 构造Color对象
---@param r number
---@param g number
---@param b number
---@return MLNColor
---@overload fun():MLNColor
---@overload fun(r:number,g:number,b:number,a:number):MLNColor
function Color(r,g,b) end

--- 设置rgb颜色
---@param v number
---@overload fun(self:MLNColor):number 获取颜色值
function M:hex(v) end

--- 设置alpha值
---@param v number [0,1]
---@overload fun(self:MLNColor) : number 获取alpha值
function M:alpha(v) end

--- 设置red值
---@param v number [0,255]
---@overload fun(self:MLNColor) : number 获取red值
function M:red(v) end

--- 设置blue值
---@param v number [0,255]
---@overload fun(self:MLNColor) : number 获取blue值
function M:blue(v) end

--- 设置green值
---@param v number [0,255]
---@overload fun(self:MLNColor) : number 获取green值
function M:green(v) end

--- 设置为透明
function M:clear() end

--- 设置16进制数据和透明度
---@param hex number
---@param alpha number
function M:setHexA(hex,alpha) end

--- 设置rgba值
---@param red number
---@param blue number
---@param green number
---@param alpha number
function M:setRGBA(red,blue,green,alpha) end

--- 用字符串设置颜色
---@param color string 颜色字符串, 支持：“#ffffffff”(后两位是透明通道)或“rgb(12,23,34)”或“rgba(12,23,45,0.1)”
function M:setColor(color) end

--- 设置字符串颜色，第一位是透明度
---@param color string 颜色字符串, 支持：“#ARGB” 如：“#ffffffff”,前两位是透明通道值
function M:setAColor(color) end
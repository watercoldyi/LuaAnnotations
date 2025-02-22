---@meta

---@class MLNImageButton : MLNView
---图片按钮控件
---==
---图片按钮控件只能设置图片，不能设置文字,如果不考虑按压时候的状态，请使用ImageView， 非容器视图，不可以添加子视图
local M = {}

---创建图片按钮实例
---@return MLNImageButton
function ImageButton() end

--- 设置ID
---@param id string
function M:ID(id) end

---设置图片
---@param url string? 正常状态图片路径
---@param url2 string? 按下时图片路径
function M:setImage(url,url2) end
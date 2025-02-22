---@class MLNStyleString
local M = {}

---@return MLNStyleString
function StyleString(str) end

--- 设置字体
--- ==
--- Android的这个接口，系统要求api28以上，Android版本8.2以下的手机都不生效
---@param name string?
---@return string?
function M:fontName(name) end

---给指定内容设置字体
---==
--- 如果此方法与setFontName同时使用，应先调用fontName方法，并且Android的这个接口，系统要求api28以上，Android版本8.2以下的手机都不生效
---@param fontName string
---@param index number 
---@param length number 
function M:setFontNameForRange(fontName, index, length) end

---给指定内容设置字体大小
---@param fontSize number
---@param index number
---@param length number
function M:setFontSizeForRange(fontSize, index, length) end

---设置字体大小
---@param size number?
---@return number?
function M:fontSize(size) end

---设置字体样式
---@param style FontStyle?
---@return FontStyle?
function M:fontStyle(style) end

---给部分内容设置字体样式
---@param fontStyle FontStyle
---@param index number
---@param length number
function M:setFontStyleForRange(fontStyle,index,length) end

---设置字体颜色
---@param color MLNColor?
---@return MLNColor?
function M:fontColor(color) end

---给部分内容设置字体颜色
---@param fontColor MLNColor
---@param index number
---@param length number
function M:setFontColorForRange(fontColor,index, length) end

---设置背景颜色
---@param color MLNColor?
---@return MLNColor?
function M:backgroundColor(color) end

---给部分内容设置背景色
---@param color MLNColor
---@param ndex number
---@param length number
function M:setBackgroundColorForRange(color,ndex,length) end

---设置或获取下划线
---@param style UnderlineStyle?
---@return UnderlineStyle?
function M:underline(style) end

---设置部分内容下划线
---@param style UnderlineStyle
---@param index number
---@param length number
function M:setUnderlineForRange(style,index, length) end

---以Image的形式展示，常用于图文混排
---@param size MLNSize
---@return boolean
function M:showAsImage(size) end

---尾部追加StyleString
---@param styleString MLNStyleString
function M:append(styleString) end

---计算显示该内容需要的最小尺寸
---==
---此方法在iOS上算的不准，可能导致iOS上 用来设置label宽度时，文字被截断。 iOS上建议使用StringUtil:sizeWithContentFontSize方法； 另外，如果是用于 label 布局，推荐使用线性布局。
---@param maxWidth number
function M:calculateSize(maxWidth) end

---设置文本内容
---@param content string
function M:setText(content) end
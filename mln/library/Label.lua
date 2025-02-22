---@meta

---@class MLNLabel : MLNView
local M = {}

---@return MLNLabel
function Label() end

---设置文本
---@param content string
---@return MLNLabel
---@overload fun():string
function M:text(content) end

---设置或者获取文本对齐方式
---@param align TextAlign
---@return MLNLabel
---@overload fun():MLNLabel
function M:textAlign(align) end

---获取或者设置字体大小
---@param size number?
---@return number?
function M:fontSize(size) end

---设置或者获取文本颜色
---@param color MLNColor?
---@return MLNColor?
function M:textColor(color) end

---获取或者设置最大行数
---@param num number?
---@return number?
function M:lines(num) end

---设置或者获取截断模式
---@param mode BreakMode?
---@return BreakMode?
function M:breakMode(mode) end

---设置富文本
---@param ss MLNStyleString?
---@return MLNStyleString?
function M:styleText(ss) end

---设置文字内容距边界距离
---@param top number
---@param right number
---@param bottom number
---@param left number
function M:padding(top, right, bottom, left) end

---设置字体样式
---@param style FontStyle
function M:setTextFontStyle(style) end

---设置自定义字体
---@param name string
---@param size number 
function M:fontNameSize(name, size) end

---包裹内容，即大小按照文本内容自适应, setWrapContent(true)与width(MeasurementType.WRAP_CONTENT) && height(MeasurementType.WRAP_CONTENT)等效
---==
---当label同时设置setWrapContent方法及width(10):height(10)的情况下，展示效果取决于设置的先后顺序。如：当label设置了setWrapContent(true)之后设置width(10):height(10)，label宽度为10、高度为10；当设置width(10):height(10)固定宽高后设置WrapContent,即以setWrapContent设置为准
---@param isWrap boolean
function M:setWrapContent(isWrap) end

---设置多行文本之间行间距
---@param spacing number
function M:setLineSpacing(spacing) end

---设置是否在文字上面和下面添加一点额外的padding
---==
---仅android有效，ios空实现
---@param bool boolean
function M:a_setIncludeFontPadding(bool) end
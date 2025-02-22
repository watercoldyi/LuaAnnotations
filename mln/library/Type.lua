---@meta

---@class MLNSize
---@field width number
---@field height number

---@class MLNPoint
---@field x number
---@field y number

---@enum MeasurementType
MeasurementType = {
    WRAP_CONTENT = 1,
    MATCH_PARENT = 1,
}

---@enum LinearType
LinearType = {
    VERTICAL = 1,
    HORIZONTAL = 1
}

---@enum RectCorner
RectCorner = {
    BOTTOM_LEFT = 1,
    ALL_CORNERS = 1,
    TOP_RIGHT = 1,
    BOTTOM_RIGHT = 1,
    TOP_LEFT = 1
}

---@enum GradientType
GradientType = {
    RIGHT_TO_LEFT = 2,
    BOTTOM_TO_TOP = 4,
    LEFT_TO_RIGHT = 1,
    TOP_TO_BOTTOM = 3
}

---@enum StatusBarStyle
StatusBarStyle = {
    --深色风格，默认
    Default = 1,
    --浅色风格
    Light = 2
}

---@enum TextAlign
TextAlign = {
    CENTER = 1,
    RIGHT = 2,
    LEFT = 3
}

---@enum BreakMode
BreakMode = {
    CLIPPING = 1,
    TAIL = 2,
    HEAD = 3,
    MIDDLE = 4
}

---@enum FontStyle
FontStyle = {
    NORMAL = 0,
    ITALIC = 1,
    BOLD = 2,
    BOLD_ITALIC = 3
}

---@enum UnderlineStyle
UnderlineStyle = {
    LINE = 1,
    NONE = 2
}
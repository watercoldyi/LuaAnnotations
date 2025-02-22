---@meta
---@class MLNTableViewAdapter
local M = {}

---构造组件
---@return MLNTableViewAdapter
function TableViewAdapter() end

---设置组数回调
---@param callback fun() : number 返回组数量,不设置时为默认为1
---@return MLNTableViewAdapter
function M:sectionCount(callback) end

---设置行数回调
---@param cb fun() : number
---@return MLNTableViewAdapter
function M:rowCount(cb) end

---设置复用ID回调
---==
--- 使用该方法需要配合initCellByReuseId和fillCellDataByReuseId方法,默认id写法与此方法不要同时使用
---@param cb fun(section:number,row:number) : string
---
---     section：组数 
---     row：行数  
---     返回复用ID，string 
function M:reuseId(cb) end

---设置初始化cell的回调
---==
---使用该方法，配合fillCellDataByReuseId和reuseId方法，注意：方法中获取cell中控件宽/高是不准确的
---@param reuseId string
---@param callback fun(cell:table)
---     cell：cell视图表, 类型为Lua中的table，表中仅存在一个元素contentView 
function M:initCellByReuseId(reuseId,callback) end

---设置进行数据赋值的回调
---==
---根据复用ID，组数和行数进行cell的数据赋值操作
---
---使用该方法，配合reuseId和initCellByReuseId方法，注意：方法中获取cell中控件宽/高是不准确的
---@param reuseId string
---@param callback fun(cell:table,section:number,row:number)
function M:fillCellDataByReuseId(reuseId,callback) end

---设置初始化cell的回调
---@param callback fun(cell:table)
function M:initCell(callback) end

---设置cell赋值的回调
---@param cb fun(cell:table,section:number,row:number)
function M:fillCellData(cb) end

---点击了某行
---@param reuseId string
---@param callback fun(cell:table,section:number,row:number)
function M:selectedRowByReuseId(reuseId,callback) end

---设置点击某行回调
---@param cb fun(cell:table,section:number,row:number)
function M:selectedRow(cb) end

---设置某个reuseID对应cell的长按回调
---@param reuseId string
---@param callback fun(cell:table,section:number,row:number)
function M:longPressRowByReuseId(reuseId,callback) end

---设置cell的长按回调
---@param callback fun(cell:table,section:number,row:number)
function M:longPressRow(callback) end

---设置cell的高度回调
---@param callback fun(section:number,row:number):number
function M:heightForCell(callback) end

---根据id设置cell的高度回调
---@param reuseId string
---@param callback fun(section:number,row:number):number
function M:heightForCellByReuseId(reuseId,callback) end

---设置cell将要展示的回调
---==
---iOS端会在刚刚展示的时候就调用，Android会在完全展示后调用
---@param callback fun(cell:table,section:number,row:number)
function M:cellWillAppear(callback) end

---设置cell消失的回调
---==
---注意时机问题，即该回调的调用时机是cell已经消失
---@param callback fun(cell:table,section:number,row:number)
function M:cellDidDisappear(callback) end

---按复用ID设置cell将要展示的回调
---@param reuseId string
---@param callback fun(cell:table,section:number,row:number)
function M:cellWillAppearByReuseId(reuseId,callback) end

---设置cell消失的回调
---==
---注意时机问题，即该回调的调用时机是cell已经消失
---@param reuseId string
---@param callback fun(cell:table,section:number,row:number)
function M:cellDidDisappearByReuseId(reuseId,callback) end

---点击Cell后高亮
---@param isShow boolean
---@return MLNTableViewAdapter
---@overload fun() : boolean
function M:showPressed(isShow) end

---点击后的高亮颜色
---@param pressedColor MLNColor
---@return MLNTableViewAdapter
---@overload fun() : MLNColor
function M:pressedColor(pressedColor) end
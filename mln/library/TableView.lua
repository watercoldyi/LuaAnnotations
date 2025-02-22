---@meta
---@class MLNTableView : MLNView
local M = {}

---创建组件
---@param refreshEnable boolean
---@param loadEnable boolean
---@return MLNTableView
function TableView(refreshEnable,loadEnable) end

---设置绑定
---@param adp MLNTableViewAdapter
---@return MLNTableView
---@overload fun() : MLNTableViewAdapter
function M:adapter(adp) end

---设置加载更多的阈值，默认为0，取值范围0~1
---@param threshold number [0,1]
---@return MLNTableView
---@overload fun() : number
function M:loadThreshold(threshold) end

---是否显示滚动指示器
---@param show boolean
---@return MLNTableView
function M:showScrollIndicator(show) end

---设置内容偏移量
---==
---contentOffset，即内容偏移量，我们把tableView内容的左上角坐标看做原点origin(0, 0),内容偏移量即为当前实现内容的左上角坐标pt与origin之间的差值contentOffset(pt.x - origin.x, pt.y - origin.y)
---@param offset MLNPoint
---@return MLNTableView
---@overload fun() : MLNPoint
function M:contentOffset(offset) end

---设置开始滚动的回调
---@param callback fun(x:number,y:number)
---@return MLNTableView
function M:setScrollBeginCallback(callback) end

---设置滚动中的回调
---@param callback fun(x:number,y:number)
---@return MLNTableView
function M:setScrollingCallback(callback) end

---设置拖拽结束后的回调
---@param callback fun(x:number,y:number)
---@return MLNTableView
function M:setEndDraggingCallback(callback) end

---设置开始减速滚动的回调
---@param callback fun(x:number,y:number)
---@return MLNTableView
function M:setStartDeceleratingCallback(callback) end

---设置是否展示滚动指示器
---==
---Android部分场景，指示器位置不能划到底部
---@param show boolean 默认为true
---@return MLNTableView
function M:setScrollIndicator(show) end

---重新回调所有的cell高度，并回调当前屏幕上cell的init和filData方法
---==
--- 在数据量特别大的情况下，当数据量较大并且使用heightForCell回调高度时，注意涉及到需要计算的高度要使用lua table进行缓存
function M:reloadData() end

---刷新某一行的数据
---==
---动画效果仅ios有效，并且使用时请勿改变其他cell的内容，否则两端会有差异：android可以更新多个cell，ios只能更新单个
---@param row number
---@param section number
---@param animated boolean
function M:reloadAtRow(row,section,animated) end

---刷新某个组里所有行的数据
---==
---动画效果仅ios有效，并且使用时请勿改变其他cell的内容，否则两端会有差异：android可以更新多个cell，ios只能更新单个
---@param section number
---@param animated boolean
function M:reloadAtSection(section,animated) end

---滚动到控件的顶部
---@param animated boolean
function M:scrollToTop(animated) end

---滚动到某个cell
---@param row number
---@param section number
---@param animated boolean
function M:scrollToCell(row,section,animated) end

---删除某行cell
---@param row number
---@param section number
function M:deleteCellAtRow(row,section) end

---在指定位置插入cell
---@param row number
---@param section number
function M:insertCellAtRow(row,section) end

---删除指定位置的cell
---@param section number
---@param startRow number
---@param endRow number
function M:deleteCellsAtSection(section,startRow,endRow) end

---在指定位置插入cell
---@param section number
---@param startRow number
---@param endRow number
function M:insertCellsAtSection(section,startRow,endRow) end

---在指定位置插入cell
---@param row number
---@param section number
---@param animated boolean
function M:insertRow(row,section,animated) end

---删除指定位置的cell
---@param row number
---@param section number
---@param animated boolean
function M:deleteRow(row,section,animated) end

---在指定位置范围插入cell
---@param section number
---@param startRow number
---@param endRow number
---@param animated boolean
function M:insertRowsAtSection(section,startRow,endRow,animated) end

---在指定位置范围删除cell
---@param section number
---@param startRow number
---@param endRow number
---@param animated boolean
function M:deleteRowsAtSection(section,startRow,endRow,animated) end

---是否在最顶端
---@return boolean
function M:isStartPosition() end

---设置是否开启下拉刷新功能
---==
---需要确保对应刷新的handler已经添加,在刷新过程中关闭会导致视图抖动
---@param enable boolean
---@return MLNTableView
---@overload fun() : boolean
function M:refreshEnable(enable) end

---获取当前是否正在刷新中
---@return boolean
function M:isRefreshing() end

---开始刷新动作
function M:startRefreshing() end

---停止刷新动作
function M:stopRefreshing() end

---设置触发下拉刷新的回调
---@param callback function
function M:setRefreshingCallback(callback) end

---设置是否开启上拉加载更多
---@param enable boolean
---@return MLNTableView
---@overload fun() : boolean
function M:loadEnable(enable) end

---获取是否正在上拉加载中
---@return boolean
function M:isLoading() end

---停止加载更多的动作
function M:stopLoading() end

---触发没有更多数据，在TableView的底部会展示没有更多数据的提示
function M:noMoreData() end

---去除“没有更多数据”的状态，将状态变成普通状态
function M:resetLoading() end

---触发加载失败
function M:loadError() end

---滚动到指定位置
---==
---iOS可用, android sdk version >= 1.5.0可用
---@param offset MLNPoint
function M:setOffsetWithAnim(offset) end

---设置触发了加载更多的回调
---@param callback function
function M:setLoadingCallback(callback) end

---返回指定位置的cell, 只对屏幕内cell有效
---@param section number
---@param row number
function M:cellWithSectionRow(section,row) end

---返回当前屏幕展示的所有cell
function M:visibleCells() end

---设置是否可以滚动
---@param enable boolean
function M:setScrollEnable(enable) end

---设置是否开启弹性效果
---==
---iOS私有方法，仅在必要时使用，使用时需判断平台
---@param bounces boolean
---@return MLNTableView
---@overload fun() : boolean
function M:i_bounces(bounces) end

---设置是否开启垂直弹性效果
---==
---iOS私有方法，仅在必要时使用，使用时需判断平台
---@param bounces boolean
---@return MLNTableView
---@overload fun():boolean
function M:i_bounceVertical(bounces) end
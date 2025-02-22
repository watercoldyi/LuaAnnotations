---@meta

---@class MLNView
local M = {}

---@return MLNView
function View() end

--- 设置宽度
---@param v number 宽度
---@return MLNView
---@overload fun(self:MLNView): number 获取宽度
function M:width(v) end

--- 设置高度
---@param v number 高度
---@return MLNView
---@overload fun(self:MLNView): number 获取高度
function M:height(v) end


--- 设置上外边距
---@param v number
---@return MLNView
---@overload fun(self:MLNView): number
function M:marginTop(v) end

--- 设置左外边距
---@param v number
---@return MLNView
---@overload fun(self:MLNView): number
function M:marginLeft(v) end

--- 设置右外边距
---@param v number
---@return MLNView
---@overload fun(self:MLNView): number
function M:marginRight(v) end

--- 设置下外边距
---@param v number
---@return MLNView
---@overload fun(self:MLNView): number
function M:marginBottom(v) end

--- 约束优先级
---@param v number [0,1000]
---@return MLNView
function M:priority(v) end

--- 约束权重
---@param v number [0,1000]
---@return MLNView
---@remark 只能在LinearLayout中有用
---@overload fun(self:MLNView):number
function M:weight(v) end

--- 设置内边距
---@param top number
---@param right number
---@param bottom number
---@param left number
---@return MLNView
function M:padding(top,right,bottom,left) end

---@param v number
---@return MLNView
function M:setMinWidth(v) end

---@param v number
---@return MLNView
function M:setMaxWidth(v) end

---@param v number
---@return MLNView
function M:setMinHeight(v) end

---@param v number
---@return MLNView
function M:setMaxHeight(v) end

---@return MLNView
---@remark window返回nil
function M:superview() end

--- 添加子视图
---@param subview MLNView
function M:addView(subview) end

--- 插入子视图
---@param subview MLNView
---@param idx number
function M:insertView(subview,idx) end

--- 从父视图中删除自己
function M:removeFromSuper() end

--- 删除所有子视图
function M:removeAllSubviews() end

--- 转换坐标
---@param otherView MLNView 参考视图
---@param point MLNPoint 被转换的坐标点，是参考视图的相对坐标点
---@return MLNPoint 转换后相对自身坐标的坐标点
function M:convertPointTo(otherView,point) end

--- 转换坐标
---@param otherView MLNView 参考视图
---@param point MLNPoint 被转换的坐标点，是参考视图的相对坐标点
---@return MLNPoint 转换后相对自身坐标的坐标点
function M:convertPointFrom(otherView,point) end

--- 设置重力约束
---@param gravity Gravity
---@return MLNView
function M:setGravity(gravity) end

---@param otherView MLNView 参考视图
---@param point MLNPoint 被转换的坐标点，是参考视图的相对坐标点
---@return MLNPoint 转换后相对自身坐标的坐标点
function M:convertRelativePointTo(otherView,point) end

--- 设置alpha值
---@param v number [0-1]
---@overload fun(self:MLNView) : number 获取alpha值[0-1]
function M:alpha(v) end

--- 设置视图是否隐藏，默认为false，不隐藏。该方法隐藏后依然占位，如果不想占位，请使用gone
---@param v boolean
---@return MLNView
---@overload fun(self:MLNView):boolean 获取是否隐藏
function M:hidden(v) end

--- 设置视图是否隐藏,开启后，视图在LinearLayout中将不占位置
---@param v boolean
---@return MLNView
---@overload fun(self:MLNView):boolean
function M:gone(v) end

--- 设置边框宽度
---@param v number
---@return MLNView
---@overload fun(self:MLNView):number 获取边框宽度
function M:borderWidth(v) end

--- 设置边框颜色
---@param v MLNColor
---@return MLNView
---@overload fun(self:MLNView):MLNColor 获取边框颜色
function M:borderColor(v) end

--- 设置背景颜色
---@param v MLNColor
---@return MLNView
---@overload fun(self:MLNView):MLNColor 获取背景颜色
function M:bgColor(v) end

---设置圆角半径
---@param radius number
---@return MLNView
---@overload fun(self:MLNView):number
function M:cornerRadius(radius) end

--- 根据方向设置圆角半径
---@param radius number
---@param corner RectCorner
---@return MLNView
function M:setCornerRadiusWithDirection(radius,corner) end

--- 获取指定方向的圆角半径
--- @param corner RectCorner
--- @return number
function M:getCornerRadiusWithDirection(corner) end

--- 设置子视图是否在view的边界内绘制
--- @param isClip boolean
--- @return MLNView
function M:clipToBounds(isClip) end

--- 设置圆角后，是否切割，默认切割false；优化性能使用
--- ==
--- iOS空实现，仅Android可用，Android sdk1.5.0 默认切割子View。可以改用addCornerMask()绘制圆角遮罩
---@param noClip boolean
---@return MLNView
function M:notClip(noClip) end

--- 以覆盖一张中间透明周边含有指定颜色圆角的图片的方式实现圆角效果
--- ==
--- 这是一种提高圆角切割性能的方案，对于子视图超出父视图显示的情况，不建议使用该方式。
---@param cornerRadius number
---@param maskColor MLNColor
---@param corners RectCorner
---@return MLNView
function M:addCornerMask(cornerRadius,maskColor,corners) end

---设置线性渐变色
---@param startColor MLNColor
---@param endColor MLNColor
---@param isVertical boolean
---@return MLNView
function M:setGradientColor(startColor,endColor,isVertical) end

--- 设置线性渐变色，支持正向反向
---@param startColor MLNColor
---@param endColor MLNColor
---@param type GradientType
---@return MLNView
function M:setGradientColorWithDirection(startColor,endColor,type) end

--- 设置当前视图是否可以响应用户的点击，触摸等交互事件
--- ==
--- 该属性关闭后，不仅会导致自身无法响应事件，而且子视图也无法响应事件。所以当业务中遇到某些控件无法响应，可以考虑是否是自身或父视图禁用了用户交互。
---@param usable boolean
---@return MLNView
---@overload fun(self:MLNView) : boolean
function M:enabled(usable) end

--- 设置点击事件回调
--- ==
--- iOS采用的是手势监听，所以要注意事件冲突，在冲突时可使用touchEnd方法
---@param callback function
function M:onClick(callback) end

--- 设置长按回调
---@param callback function
function M:onLongPress(callback) end

--- 获取是否有焦点
---@return boolean
function M:hasFocus() end

--- 能否获取焦点
--- @return boolean
function M:canFocus() end

--- 获取焦点
--- @return MLNView
function M:requestFocus() end

--- 取消焦点
function M:cancelFocus() end

---触摸开始的回调
---==
---@param callback fun(x : number,y : number,screenX :number,screenY : number,v : MLNView,time : number)
---     x:触摸点在视图中的x轴坐标 
---     y:触摸点在视图中的y轴坐标 
---     screenX:触摸点在屏幕中的x轴坐标 
---     screenY:触摸点在屏幕中的y轴坐标 
---     v:触摸事件回调的视图 
---     time:触摸事件时间 
function M:touchBegin(callback) end

---触摸移动时的回调
---==
---@param callback fun(x : number,y : number,screenX :number,screenY : number,v : MLNView,time : number)
---     x:触摸点在视图中的x轴坐标 
---     y:触摸点在视图中的y轴坐标 
---     screenX:触摸点在屏幕中的x轴坐标 
---     screenY:触摸点在屏幕中的y轴坐标 
---     v:触摸事件回调的视图 
---     time:触摸事件时间 
function M:touchMove(callback) end

---触摸结束的回调
---==
---该坐标是手指抬起时的坐标
---
---@param callback fun(x : number,y : number,screenX :number,screenY : number,v : MLNView,time : number)
---     x:触摸点在视图中的x轴坐标 
---     y:触摸点在视图中的y轴坐标 
---     screenX:触摸点在屏幕中的x轴坐标 
---     screenY:触摸点在屏幕中的y轴坐标 
---     v:触摸事件回调的视图 
---     time:触摸事件时间 
function M:touchEnd(callback) end

---触摸取消的回调
---==
---该回调在用户移出当前视图时会调用
---
---@param callback fun(x : number,y : number,screenX :number,screenY : number,v : MLNView,time : number)
---     x:触摸点在视图中的x轴坐标 
---     y:触摸点在视图中的y轴坐标 
---     screenX:触摸点在屏幕中的x轴坐标 
---     screenY:触摸点在屏幕中的y轴坐标 
---     v:触摸事件回调的视图 
---     time:触摸事件时间
function M:touchCancel(callback) end

---触摸开始时的回调
---==
---@param callback fun(map:table)
---
---     map参数如下：
---     x:触摸时相对父控件x坐标值 
---     y:触摸时相对父控件y坐标值 
---     screenX:触摸时相对屏幕x坐标 
---     screenY:触摸时相对屏幕Y坐标 
---     target:触摸到的view 
---     timeStamp:触摸时间（单位s）
function M:touchBeginExtension(callback) end

---触摸结束时的回调
---==
---@param callback fun(map:table)
---
---     map参数如下：
---     x:触摸时相对父控件x坐标值 
---     y:触摸时相对父控件y坐标值 
---     screenX:触摸时相对屏幕x坐标 
---     screenY:触摸时相对屏幕Y坐标 
---     target:触摸到的view 
---     timeStamp:触摸时间（单位s）
function M:touchEndExtension(callback) end

---触摸移动时的回调
---==
---@param callback fun(map:table)
---
---     map参数如下：
---     x:触摸时相对父控件x坐标值 
---     y:触摸时相对父控件y坐标值 
---     screenX:触摸时相对屏幕x坐标 
---     screenY:触摸时相对屏幕Y坐标 
---     target:触摸到的view 
---     timeStamp:触摸时间（单位s）
function M:touchMoveExtension(callback) end

---触摸取消时的回调
---==
---@param callback fun(map:table)
---
---     map参数如下：
---     x:触摸时相对父控件x坐标值 
---     y:触摸时相对父控件y坐标值 
---     screenX:触摸时相对屏幕x坐标 
---     screenY:触摸时相对屏幕Y坐标 
---     target:触摸到的view 
---     timeStamp:触摸时间（单位s）
function M:touchCancelExtension(callback) end

---锚点，动画作用的位置，从0~1的比例，在视图中对应位置
---@param x number 
---@param y number
function M:anchorPoint(x,y) end

--- 旋转视图
---@param rotate number
---@param notAdding boolean
function M:rotation(rotate,notAdding) end

--- 缩放视图
---@param x number
---@param y number
---@param add boolean
function M:scale(x,y,add) end

--- 位移视图
---@param x number
---@param y number
---@param add boolean
function M:translation(x,y,add) end

--- 重置Transform
function M:transformIdentity() end

---删除所有动画
function M:removeAllAnimation() end

---视图截屏
---@param filename string
function M:snapshot(filename) end

---添加高斯模糊
---==
---iOS有效，Android空实现
function M:addBlurEffect() end

---删除高斯模糊
function M:removeBlurEffect() end

---设置点击时的效果
---==
---Android上为波纹效果，iOS上是一种灰色高亮
---@param open boolean
function M:openRipple(open) end

---设置是否开启点击收起键盘功能
---@param open boolean
function M:canEndEditing(open) end

---将当前视图的子视图移动到所有子视图的最上层
---==
---LinearLayout不可使用该方法。️Android不能实现将某个View放入图层下方或上方，View可以做到是通过将子视图加入顺序调换实现，LinearLayout若调换顺序，将导致布局出错
---@param subView MLNView
function M:bringSubviewToFront(subView) end

---将子视图放到最下层
---==
--- LinearLayout不可使用该方法。️Android不能实现将某个View放入图层下方或上方，View可以做到是通过将子视图加入顺序调换实现，LinearLayout若调换顺序，将导致布局出错
---@param subView any
function M:sendSubviewToBack(subView) end

---给视图设置背景图片
---==
---背景图片只支持本地资源
---@param imageName string
function M:bgImage(imageName) end

---给视图添加矩形或圆形阴影
---==
---1.cornerRadius+Shadow 使用时: 1)不能对同一个View用ClipToBounds()，否则无效; 2)Android 给子View使用Shadow，子View不能充满容器，否则阴影被Parent切割 2.setCornerRadiusWithDirection 禁止与Shadow连用; 3.阴影的View有Z轴高度，会遮挡没有Z轴高度的同层View
---@param shadowOffset MLNSize
---@param shadowRadius number
---@param opacity number
function M:setShadow(shadowOffset,shadowRadius,opacity) end

---子视图从父视图移除时的回调
---@param callback function
function M:onDetachedView(callback) end

--- 开始画布动画(CanvasAnimation)，不会影响布局
--- ==
--- 不可使用FrameAnimation和Animation
---@param animation any
function M:startAnimation(animation) end

---停止View里的画布动画
---==
---非画布动画不会停止
function M:clearAnimation() end
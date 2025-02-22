---@class MNLWindow : MLNView
---特定的全局视图变量，作为当前lua界面的根视图
---在单个lua虚拟机中全局唯一，作为根布局，用来承载所有的子视图。
---
---window的生命周期方法调用顺序为：
---
---     1.sizeChanged
---     2.viewAppear
---     3.viewDisappear
---     4.onDestroy
---
---不可修改该全局视图变量。
---
---由于Android布局系统原因，建议不要使用绝对值进行相关布局，而使用相对布局（Match Parent, Wrap Content, margin, Gravity）。大多数情况下，需要使用绝对值的布局可以被相对布局代替，比如需要在距离屏幕底部100的位置有个按钮，可使用：Gravity.Bottom加marginBottom来实现。 如果一定需要获取屏幕高度，并根据此高度布局，使用window:height()获取高度，并监听window:sizeChanged(function)，在屏幕尺寸改变时，改变相应视图
local M = {}

---@type MNLWindow
window = M

---设置页面显示时回调
---==
---该方法会在页面进入时调用，当该页面为APP展示页面时，APP切前后台也会触发。
---@param cb function
function M:viewAppear(cb) end

---设置页面隐藏时回调
---==
---该方法会在页面退出时调用，当该页面为APP展示页面时，APP切前后台也会触发。
---@param cb function
function M:viewDisappear(cb) end

---设置页面宽或高变化时的回调
---@param callback fun(w:number,h:number)
function M:sizeChanged(callback) end

---设置页面销毁前的回调
---@param callback function
function M:onDestroy(callback) end

---获取在原生业务中为lua设置的拓展参数
---==
---该方法可用的前提是在唤起lua业务前，调用lua instance的setExtraData方法将业务需要的拓展数据赋值给window，供lua业务在执行时获取
---@return table
function M:getExtra() end

---获取当前加载的lua业务的版本号，版本号0为预埋包
---==
---获取lua业务版本的方法，跟SDK没有关系，只跟业务的定义有关
---@return string
function M:getLuaVersion() end

---获取当前加载的lua文件来源
---==
---获取当前加载的lua文件来源，通过URL加载的返回URL，通过lua文件加载的返回文件名
function M:getLuaSource() end

---设置监听键盘的展示和隐藏
---@param callback fun(isShowing : boolean,kbHeight : number)
---
---     isShowing:展示or隐藏 
---     keyBoardHeight:键盘高度，隐藏时为0 
function M:keyboardShowing(callback) end

---键盘frame改变回调
---==
---ios支持，android空实现
---@param cb fun(oldHeight : number,newHeight: number)
function M:i_keyBoardFrameChangeCallback(cb) end

---设置window的背景颜色
---@param pageColor MLNColor
function M:setPageColor(pageColor) end

---获取电池栏（状态栏）高度
---==
--- 建议在非全屏，即展示状态栏的情况下使用，否则会返回0
---@return number
function M:statusBarHeight() end

---获取导航条高度
---@return number
function M:navBarHeight() end

---获取tab bar高度
---==
---在Android和iOS两端是不一样的
---@return number
function M:tabBarHeight() end

---获取home虚拟按键高度
---==
---建议在非全屏，即有虚拟按键时，使用该方法最为准确
---@return number
function M:homeBarHeight() end

---设置返回键监听方法
---==
---仅Android有效，IOS空实现 安卓原生端需要做如下处理：
---Activity或ViewGroup中此方法可生效，Fragment中暂时还不会生效;
---在显示LuaView的Activity中 dispatchKeyEvent() 方法添加如下代码：
---```
---if (event.getKeyCode() == KeyEvent.KEYCODE_BACK && event.getAction() != KeyEvent.ACTION_UP) {
---     MLSInstance..dispatchKeyEvent(event);
---}
---```
---@param callback any
function M:backKeyPressed(callback) end

---获取状态栏颜色样式
---@return StatusBarStyle
function M:getStatusBarStyle() end

---设置状态栏颜色风格
---==
---记得设置后在视图消失时置回设置前的样式
---@param style StatusBarStyle
function M:setStatusBarStyle(style) end

---是否执行返回到上一个页面的操作，默认值为true，当不传递参数时，是获取是否可以执行返回键操作的boolean值
---==
---安卓支持，ios空实现
---@param isEnable boolean
---@overload fun(self:MNLWindow):boolean
function M:backKeyEnabled(isEnable) end
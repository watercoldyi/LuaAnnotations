---@meta

---@class LuaSqlEnv
local Env = {}

--- 创建一个连接
---@param path string
---@return LuaSqlConn
function Env:connect(path) end

--- 关闭环境
function Env:close() end

---@class LuaSqlConn
local Connection = {}

---@param sql string sql语句
---@return LuaSqlCursor | integer | nil,string
---@overload fun(cnn:LuaSqlConn,sql:string,params:table) 要绑定的参数
---@overload fun(cnn:LuaSqlConn,sql:string,...) 可变参数作为sql的绑定值
function Connection:execute(sql) end

--- 提交事务
function Connection:commit() end

--- 回滚事务
function Connection:rollback() end

--- 打开或关闭 "自动提交 "模式。在不执行事务的数据库系统中，该功能可能不起作用。在没有 "自动提交模式 "概念但实现了事务的数据库系统中，该机制由驱动程序实现。
---@param v boolean
---@return boolean 成功时为true，无法执行操作或未执行操作时为false
function Connection:setautocommit(v) end

--- 获取最后插入的rowid
---@return integer
function Connection:getlastautoid() end

--- 转换字符串为安全的可插入字符
---@param str string
---@return string | nil
function Connection:escape(str) end

function Connection:close() end

---@class LuaSqlCursor
local Cursor = {}

function Cursor:close() end

---@return string[] 结果集的列名
function Cursor:getcolnames() end

---@return string[] 结果集列的数据类型
function Cursor:getcoltypes() end

---@param coll table 接受数据的表
---@param mode "n"|"a"    结果模式
---       "n" 将行数据作为数据拷贝到coll中<br>
---       "a" 将行数据用coll[colname]=value的形式拷贝到coll中<br>
---@return table | nil,string "成功时返回coll,失败时返回nil+错误消息"
---@overload fun(cur:LuaSqlCursor): ...|nil,string   直接将行数据展开返回
function Cursor:fetch(coll,mode) end

local M = {}

---@return LuaSqlEnv
function M.sqlite3() end



return M
---@meta

local _M = {}

---@class MtmsgBuffer
local buffer = {}

--- Returns the buffer's id as integer. This id is unique for the whole process.
---@return integer
function buffer:id() end

--- Returns the buffer's name that was given to mtmsg.newbuffer() or to listener:newbuffer().
---@return string
function buffer:name() end

--- Adds the arguments together as one message to the buffer. 
---@param ... any Arguments can be simple data types (string, number, boolean, nil, light user data, C function) or carray objects.
---@return boolean
--- * Returns true if the message could be added to the buffer.
--- * Returns false if buffer:isnonblock() == true and the buffer is concurrently accessed from a parallel thread.
--- * Returns false if the buffer was created with a grow factor 0 and the current buffer messages together with the new message would exceed the buffer's fixed size.
--- * Possible errors: mtmsg.error.message_size, mtmsg.error.object_closed, mtmsg.error.operation_aborted
function buffer:addmsg(...) end

--- Sets the arguments together as one message into the buffer. All other messages in this buffer are discarded.
---@param ... number | string | boolean | lightuserdata Arguments can be simple data types (string, number, boolean, light user data, C function) or carray objects.
function buffer:setmsg(...) end

--- Returns the number of messages in the buffer.
---@return integer
function buffer:msgcnt() end

--- Removes all messages from the buffer.
---@return boolean
function buffer:clear() end

--- Returns all the arguments that were given as one message by invoking the method buffer:addmsg() or buffer:setmsg(). The returned message is removed from the underlying buffer.
---@param timeout number optional float, maximal time in seconds for waiting for the next message. The method returns without result if timeout is reached.
---@return any
function buffer:nextmsg(timeout) end

--- Connects a notifier object to the underlying buffer.<br/>
--- A buffer can only have one connected notifier object per notifier type "<" or ">". It is an error to call this method in case the buffer already has a connected notifier object of the same type.
---
--- Possible errors: mtmsg.error.object_closed, mtmsg.error.has_notifier
---@param ntf userdata | nil If nil is given, an existing notifier object of the specified type is disconnected from the underlying buffer.
---@param type string value "<" for a notifier that is notified if a message is removed from the buffer and ">" for a notifier that is notified if a message is added to the buffer. Default value is ">".
---@param threshold integer For notifier type "<" the notifier is notified if the current number of messages is below the threshold after a message is removed from the buffer. For notifier type ">" the notifier is notifierd if the current number of message is above the threshold after a message is added to the buffer. If nil or not given the threshold is not considered. i.e. the corresponding notifier is always called if a message is removed or added.
function buffer:notifier(ntf,type,threshold) end

--- if flag is not given or true the buffer referencing object will operate in nonblock mode. This does not affect the underlying buffer, i.e. several buffer referencing objects could operate in different modes accessing the same buffer.
---
--- Nonblock mode affects the methods buffer:nextmsg(), buffer:addmsg() and buffer:setmsg(): all these methods return immediately with negative result if the underlying buffer is concurrently accessed from another thread.
---
--- Nonblock mode can be useful for realtime processing, when it is more importent to continue processing and a blocking operation could be postponed or be skipped.
---@param flag boolean | nil
function buffer:nonblock(flag) end

--- @return boolean
function buffer:isnonblock() end

--- Closes the underlying buffer and frees the memory. Every operation from any referencing object raises a mtmsg.error.object_closed. A closed buffer cannot be reactivated.
function buffer:close() end

--- Aborts operation on the underlying buffer.
---@param flag boolean | nil  If true or not given the buffer is aborted, i.e. a mtmsg.error.operation_aborted is raised. If false, abortion is canceled, i.e. the buffer can be used again.
function buffer:abort(flag) end

---@return boolean Returns true if buffer:abort() or buffer:abort(true) was called.
function buffer:isabort() end

--- Creates a new buffer and returns a lua object for referencing the created buffer.
---@param name string optional string, the name of the new buffer,
---@param size integer optional integer, initial size in bytes for the buffer that holds all messages for this buffer (defaults to 1024).
---@param grow number optional float, the factor how fast buffer memory grows if more data has to be buffered. If 0, the used memory is fixed by the initially given size. If <=1 the buffer grows only by the needed bytes (default value is 2, i.e. the size doubles if buffer memory needs to grow).
---@return MtmsgBuffer
---@overload fun() : MtmsgBuffer
---@overload fun(name : string) : MtmsgBuffer
---@overload fun(name : string , size : integer) : MtmsgBuffer
function _M.newbuffer(name,size,grow) end

--- Creates a lua object for referencing an existing buffer. The buffer must be referenced by its id or name. Referencing the buffer by id is much faster than referencing by name if the number of buffers increases.
--- 
--- Possible errors: mtmsg.error.ambiguous_name, mtmsg.error.unknown_object, mtmsg.error.operation_aborted
---@param id integer | string the unique buffer id that can be obtained by buffer:id().
---@return MtmsgBuffer
function _M.buffer(id) end

--- Creates a new buffer listener and returns a lua object for referencing the created listener.
---
--- Possible errors: mtmsg.error.operation_aborted,
---@param name string
---@return userdata
function _M.newlistener(name) end

--- Creates a lua object for referencing an existing listener. The listener must be referenced by its id or name. Referencing the listener by id is much faster than referencing by name if the number of listeners increases.
---
--- Possible errors: mtmsg.error.ambiguous_name, mtmsg.error.unknown_object, mtmsg.error.operation_aborted
---@param id_or_name integer | string
---@return userdata
function _M.listener(id_or_name) end

--- Aborts operation on all buffers and listeners.
---@param flag boolean | nil If true or not given all buffers and listeners are aborted i.e. a mtmsg.error.operation_aborted is raised. If false, abortion is canceled, i.e. all buffers and listeners can be used again.
function _M.abort(flag) end

--- Returns true if mtmsg.abort() or mtmsg.abort(true) was called.
--- @return boolean
function _M.isabort() end

--- Similiar to os.time(): Gives the time in seconds, but as float with higher precision (at least milliseconds).
--- @return number
function _M.time() end

--- Suspends the current thread for the specified time.
---@param timeout number
function _M.sleep(timeout) end

--- Returns the type of arg as string. Same as type(arg) for builtin types. For userdata objects it tries to determine the type from the __name field in the metatable and checks if the metatable can be found in the lua registry for this key as created by luaL_newmetatable.
---
--- Returns "userdata" for userdata where the __name field in the metatable is missing or does not have a corresponding entry in the lua registry.
---
---- Returns "mtmsg.buffer" or "mtmsg.listener" if the arg is one of the userdata types provided by the mtmsg package.
---@param arg any
---@return string
function _M.type(arg) end

--- Creates a new writer. A writer can be used to build up messages incrementally by adding new message elements using writer:add(). The message than can be added to a buffer using writer:addmsg() in one atomic step.
---
--- The created writer canot be accessed from other threads and is garbage collected like any normal Lua value.
---@param size integer initial size in bytes for the memory that holds all message elements for this writer (defaults to 1024).
---@param grow number the factor how fast memory grows if more message elements have to be buffered. If 0, the used memory is fixed by the initially given size. If <=1 the memory grows only by the needed bytes (default value is 2, i.e. the size doubles if memory needs to grow).
---@return userdata
---@overload fun() : userdata
---@overload fun(size : integer) : userdata
function _M.newwriter(size,grow) end

--- Creates a new reader. A reader can be used to parse messages incrementally by invoking reader:next() to get the message elements. Invoking reader:nextmsg() gets the next message of a buffer or listener into the reader in one atomic step.
--- 
--- The created reader canot be accessed from other threads and is garbage collected like any normal Lua value.
---@param size integer
---@param grow number 
---@overload fun() : userdata
---@overload fun(size : integer) : userdata
function _M.newreader(size,grow) end

return _M
---@meta

---
---  数字的二进制操作（例如 与，或，非 等操作）
---
---@class MBit
MBit= {}

---
---  按位“或”运算，a | b
---
---
---  此函数需要两个无符号整数作为参数，返回所有参数执行按位“或”运算后的结果
---
---@param number_a number  按位“或”运算参数1
---@param number_b number  按位“或”运算参数2
---@return number 按位“或”运算结果
function MBit.bor(number_a, number_b)
	return 0
end

---
---  按位“与”运算, a & b
---
---
---  此函数需要两个无符号整数作为参数，返回所有参数执行按位“与”运算后的结果
---
---@param number_a number  按位“与”运算参数1
---@param number_b number  按位“与”运算参数2
---@return number 按位“与”运算结果
function MBit.band(number_a, number_b)
	return 0
end

---
---  按位“异或”运算, a ^ b
---
---
---  此函数需要两个无符号整数作为参数，返回所有参数执行按位“异或”运算后的结果
---
---@param number_a number  按位“异或”运算参数1
---@param number_b number  按位“异或”运算参数2
---@return number 按位“异或”运算结果
function MBit.bxor(number_a, number_b)
	return 0
end

---
---  按位“非”运算, ~a
---
---
---  此函数需要一个无符号整数作为参数，返回这个参数执行按位“非”运算后的结果
---
---@param number_a number  按位非的参数
---@return number 按位“非”运算结果
function MBit.neg(number_a)
	return 0
end

---
---  按位左移, a << bit
---
---
---  此函数需要两个无符号整数作为参数。第一个参数是被移位的数，第二个参数是向左移动的位数
---
---@param number_a number  被左移的数
---@param number_b number  要左移的位数
---@return number "左移后的结果,a << bit"
function MBit.shl(number_a, number_b)
	return 0
end

---
---  按位右移, a >> bit
---
---
---  此函数需要两个无符号整数作为参数。第一个参数是被移位的数，第二个参数是向右移动的位数
---
---@param number_a number  被右移的数
---@param number_b number  要右移位数
---@return number "右移后的结果, a >> bit"
function MBit.shr(number_a, number_b)
	return 0
end
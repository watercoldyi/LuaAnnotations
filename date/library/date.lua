---@meta

---@class DateObject
local DateObject = {}

--- Add days in dateObject
--- If the value is negative, the adjusted dateObject will be earlier.
--- ```lua
--- a = date(2000,12,30)
--- b = date(a):adddays(3)
--- c = date.diff(b,a)
--- assert(c:spandays() == 3)
--- ```
---@param int_days number Required integer value. Days to add.
---@return DateObject | nil Success	reference to the adjusted dateObject
function DateObject:adddays(int_days) end

--- Add hours in dateObject
--- If the value is negative, the adjusted dateObject will be earlier.
--- Example
--- ```lua
--- a = date(2000,12,30)
--- b = date(a):addhours(3)
--- c = date.diff(b,a)
--- assert(c:spanhours() == 3)
--- ```
---@param num_hours integer Required number value. Hours to add.
---@return DateObject
function DateObject:addhours(num_hours) end

--- Add minutes in dateObject
---@param num_minutes integer
---@return DateObject
function DateObject:addminutes(num_minutes) end

--- Add months in dateObject
---@param int_months integer
---@return DateObject
function DateObject:addmonths(int_months) end

--- Add seconds in dateObject
---@param num_sec integer
---@return DateObject
function DateObject:addseconds(num_sec) end

--- Add ticks in dateObject
---@param num_ticks integer
---@return DateObject
function DateObject:addticks(num_ticks) end

--- Add years in dateObject
---@param int_years integer
---@return DateObject
function DateObject:addyears(int_years) end

--- Returns a new date object having the same date and time value of dateObject
---@return DateObject
function DateObject:copy() end

--- Returns a formatted version of dateObject.
---@param str_code string The format string follows the same rules as the strftime standard C function
---     '%a'	Abbreviated weekday name (Sun)
---     '%A'	Full weekday name (Sunday)
---     '%b'	Abbreviated month name (Dec)
---     '%B'	Full month name (December)
---     '%C'	Year/100 (19, 20, 30)
---     '%d'	The day of the month as a number (range 1 - 31)
---     '%g'	year for ISO 8601 week, from 00 (79)
---     '%G'	year for ISO 8601 week, from 0000 (1979)
---     '%h'	same as %b
---     '%H'	hour of the 24-hour day, from 00 (06)
---     '%I'	The hour as a number using a 12-hour clock (01 - 12)
---     '%j'	The day of the year as a number (001 - 366)
---     '%m'	Month of the year, from 01 to 12
---     '%M'	Minutes after the hour 55
---     '%p'	AM/PM indicator (AM)
---     '%S'	The second as a number (59, 20 , 01)
---     '%u'	ISO 8601 day of the week, to 7 for Sunday (7, 1)
---     '%U'	Sunday week of the year, from 00 (48)
---     '%V'	ISO 8601 week of the year, from 01 (48)
---     '%w'	The day of the week as a decimal, Sunday being 0
---     '%W'	Monday week of the year, from 00 (48)
---     '%y'	The year as a number without a century (range 00 to 99)
---     '%Y'	Year with century (2000, 1914, 0325, 0001)
---     '%z'	Time zone offset, the date object is assumed local time (+1000, -0230)
---     '%Z'	Time zone name, the date object is assumed local time
---     '%\b'	Year, if year is in BCE, prints the BCE Year representation, otherwise result is similar to "%Y" (1 BCE, 40 BCE) #
---     '%\f'	Seconds including fraction (59.998, 01.123) #
---     '%%'	percent character %
---     '%r'	12-hour time, from 01:00:00 AM (06:55:15 AM); same as "%I:%M:%S %p"
---     '%R'	hour:minute, from 01:00 (06:55); same as "%I:%M"
---     '%T'	24-hour time, from 00:00:00 (06:55:15); same as "%H:%M:%S"
---     '%D'	month/day/year from 01/01/00 (12/02/79); same as "%m/%d/%y"
---     '%F'	year-month-day (1979-12-02); same as "%Y-%m-%d"
---     '%c'	The preferred date and time representation; same as "%x %X"
---     '%x'	The preferred date representation, same as "%a %b %d %\b"
---     '%X'	The preferred time representation, same as "%H:%M:%\f"
---     '${iso}'	Iso format, same as "%Y-%m-%dT%T"
---     '${http}'	http format, same as "%a, %d %b %Y %T GMT"
---     '${ctime}'	ctime format, same as "%a %b %d %T GMT %Y"
---     '${rfc850}'	RFC850 format, same as "%A, %d-%b-%y %T GMT"
---     '${rfc1123}'	RFC1123 format, same as "%a, %d %b %Y %T GMT"
---     '${asctime}'	asctime format, same as "%a %b %d %T %Y"
---@return string 
function DateObject:fmt(str_code) end

---Assuming dateObject is a local time. Returns the time zone offset. Returns nil on failure.
function DateObject:getbias() end

--- Returns the hours value using a 12-hour clock in a dateObject.
--- Example
--- ```lua
--- a = date("10:59:59 pm")
--- assert(a:getclockhour()==10)
--- ```
---@return DateObject
function DateObject:getclockhour() end

--- Returns the year, month, and day value in a dateObject.
---
--- Example
--- ```lua
--- a = date(1970, 1, 1)
--- y, m, d = a:getdate()
--- assert(y == 1970 and m == 1 and d == 1)
--- ```
---@return integer,integer,integer
function DateObject:getdate() end

--- Returns the day of month value in a dateObject
---@return integer
function DateObject:getday() end

--- Returns the seconds after the minute (fractional) value in a dateObject.
---
--- Example
--- ```lua
--- d = date("Wed Apr 04 2181 11:51:06.996 UTC")
--- assert(d:getfracsec() == 6.996)
--- ```
---@return number
function DateObject:getfracsec() end

--- Returns the hours value in a dateObject
---
--- Example
--- ```lua
--- d = date("Wed Apr 04 2181 11:51:06 UTC")
--- assert(d:gethours() == 11)
--- ```
---@return integer
function DateObject:gethours() end

--- Returns the day of week (sunday=7, monday=1, ...saturday=6) in a dateObject.
---@return integer
function DateObject:getisoweekday() end

--- Returns the ISO 8601 week number (01 to 53) in a dateObject. Using the Year-WeekOfYear-DayOfWeek date system
---
--- Example
--- ```lua
--- d = date(1975, 12, 29)
--- assert(d:getisoweeknumber() == 1)
--- assert(d:getisoyear() == 1976)
--- assert(d:getisoweekday() == 1)
--- d = date(1977, 1, 2)
--- assert(d:getisoweeknumber() == 53)
--- assert(d:getisoyear() == 1976)
--- assert(d:getisoweekday() == 7)
--- ```
---@return integer
function DateObject:getisoweeknumber() end

--- Returns the ISO 8601 year in a dateObject. Using the Year-WeekOfYear-DayOfWeek date system
---@return integer
--- Example
--- ```lua
--- d = date(1996, 12, 30)
--- assert(d:getisoyear() == 1997)
--- d = date(1997, 01, 05)
--- assert(d:getisoyear() == 1997)
--- ```
function DateObject:getisoyear() end

--- Returns the minutes after the hour value in a dateObject
---@return integer
function DateObject:getminutes() end

--- Returns the month value in a dateObject
---@return integer
function DateObject:getmonth() end

--- Returns the seconds after the minute value in a dateObject
---@return integer
function DateObject:getseconds() end

--- Returns the ticks after the seconds value in a dateObject
---@return integer
function DateObject:getticks() end

--- Returns the hours, minutes, seconds and ticks value in a dateObject.
--- Example
--- ```lua
--- a = date({hour=5,sec=.5,min=59})
--- h, m, s, t = a:gettime()
--- assert(t == 500000 and s == 0 and m == 59 and h == 5, tostring(a))
--- ```
---@return integer,integer,integer,integer
function DateObject:gettime() end

--- Returns the day of week (sunday=1, monday=2, ...saturday=7) in a dateObject.
---@return integer
function DateObject:getweekday() end

--- Returns the week number value in a dateObject.
---@param int_wdaybase integer|nil Optional integer value. The starting day of week (1 for sunday, 2 for monday, ... 7 for saturday). If omitted the starting day of week is sunday.
---@return integer
--- Example
--- ```lua
--- a = date("12/31/1972")
--- b,c = a:getweeknumber(), a:getweeknumber(2)
--- assert(b==53 and c==52)
--- ```
function DateObject:getweeknumber(int_wdaybase) end

--- Returns the year value in a dateObject
---
--- Example
--- ```lua
--- d = date(1965, 'jan', 0)
--- assert(d:getyear() == 1964)
--- ```
---@return integer
function DateObject:getyear() end

--- Returns the day of year (1-366) in a dateObject.
--- @return integer
function DateObject:getyearday() end

--- Sets the day of month value in dateObject
---@param int_mday integer A numeric value equal to the day of month. The default value is the current day of month
---@return DateObject | nil
function DateObject:setday(int_mday) end

--- Sets the hour value in dateObject
---@param num_hour integer The hours value. The default value is the current hours value
---@param num_min integer The minutes after the hours value. The default value is the current minutes value
---@param num_sec integer The seconds after the minute value. The default value is the current seconds value
---@param num_ticks integer The ticks after the second value. The default value is the current ticks value
---@return DateObject | nil
function DateObject:sethours(num_hour, num_min, num_sec, num_ticks) end

--- Sets the ISO 8601 week number value in dateObject. Using the Year-WeekOfYear-DayOfWeek date system
---@param int_wday integer The day the week. The default value is the current week day
---@return DateObject | nil
function DateObject:setisoweekday(int_wday) end

--- Sets the ISO 8601 week number value in dateObject. Using the Year-WeekOfYear-DayOfWeek date system
---@param int_week integer The week value. The default value is the current week
---@param int_wday integer The day of the week. The default value is the current week day
---@return DateObject | nil
function DateObject:setisoweeknumber(int_week, int_wday) end

--- Sets the ISO 8601 year value in dateObject. Using the Year-WeekOfYear-DayOfWeek date system
---@param int_year integer The year value. The default value is the current year
---@param int_week integer The week value. The default value is the current week
---@param int_wday integer The day of the week. The default value is the current week day
---@return DateObject | nil
function DateObject:setisoyear(int_year, int_week, int_wday) end

--- Sets the minutes value in dateObject
---@param num_min integer The minutes after the value. The default value is the current minutes value
---@param num_sec integer The seconds after the minute value. The default value is the current seconds value
---@param num_ticks integer The ticks after the second value. The default value is the current ticks value
---@return DateObject | nil
function DateObject:setminutes(num_min, num_sec, num_ticks) end

---Sets the month value in dateObject
---@param var_month integer The default value is the current month
---@param int_mday integer The day of month. The default value is the current day of month
---@return DateObject | nil
function DateObject:setmonth(var_month, int_mday) end

--- Sets the seconds after the minute value in dateObject
---@param num_sec integer The seconds after the minute value. The default value is the current seconds value
---@param num_ticks integer The ticks after the second value. The default value is the current ticks value
---@return DateObject | nil
function DateObject:setseconds(num_sec, num_ticks) end

--- Sets the ticks after the second value in dateObject
---@param num_ticks integer The ticks after the second value. The default value is the current ticks value
---@return DateObject | nil
function DateObject:setticks(num_ticks) end

--- Sets the year value in dateObject
---@param int_year integer The year value. The default value is the current year
---@param var_month integer The month value. The default value is the current month
---@param int_mday integer The day of month. The default value is the current day of month
---@return DateObject | nil
function DateObject:setyear(int_year, var_month, int_mday) end

--- Returns how many days the dateObject has
--- ```lua
--- a = date(2181, "aPr", 4, 6, 30, 30, 15000)
--- b = date(a):adddays(2)
--- c = date.diff(b, a)
--- assert(c:spandays() == (2))
--- ```
---@return DateObject | nil
function DateObject:spandays() end

--- Returns how many hours the dateObject has
---@return DateObject | nil
function DateObject:spanhours() end

--- Returns how many minutes the dateObject has
---@return DateObject | nil
function DateObject:spanminutes() end

--- Returns how many seconds the dateObject has
---@return DateObject | nil
function DateObject:spanseconds() end

--- Returns how many ticks the dateObject has
---@return DateObject | nil
function DateObject:spanticks() end

--- Assuming dateObject is a utc time. Convert its date and time value to local time.
---@return DateObject | nil
function DateObject:tolocal() end

--- Assuming dateObject is a local time. Convert its date and time value to utc time.
---@return DateObject | nil
function DateObject:toutc() end

---@overload fun(bool_now : boolean): DateObject if bool_now is false it returns the current local date and time. if bool_now is true it returns the current UTC date and time.
---@overload fun(num_time : integer): DateObject Represents the number of seconds in Universal Coordinated Time between the specified value and the System epoch.
---@overload fun(str_date : string): DateObject
---@overload fun(tbl_date : table): DateObject The constructor will look for the value of this key:
---     * year - an integer, the full year, for example, 1969. Required if month and day is given
---     * month - a parsable month value. Required if year and day is given
---     * day - an integer, the day of month from 1 to 31. Required if year and month is given
---     * hour - a number, hours value, from 0 to 23, indicating the number of hours since midnight. (default = 0)
---     * min - a number, minutes value, from 0 to 59. (default = 0)
---     * sec - a number, seconds value, from 0 to 59. (default = 0)
---@overload fun(year : integer,month : integer,day : integer,hour : integer,min : integer,sec : integer,ticks : integer): DateObject 
local _M = setmetatable({},{
    __call = function(...) end
})

--- Returns dateObject whose date and time value is the Operating System epoch.
--- @return DateObject
function _M.epoch() end

--- Subtract the date and time value of two dateObject and returns the resulting dateObject.
--- ```lua
--- d = date.diff("Jan 7 1563", date(1563, 1, 2))
--- assert(d:spandays()==5)
--- ```
---@param date1 DateObject
---@param date2 DateObject
---@return DateObject
function _M.diff(date1,date2) end

--- Returns the current global setting for centuryflip.
function _M.getcenturyflip() end

--- Check if a number or dateObject is a leapyear.
---@param var_year integer | DateObject | string  a number or dateObject or parsable date value
---@return boolean
function _M.isleapyear(var_year) end

--- Sets the global value for centuryflip. Century flip determines how 2-digit years are interpreted when parsing string values. Any value smaller than centuryflip will be considered 20xx, and values greater or equal will become 19xx.
--- The default value is 0, so all 2 digit years are considered 19xx.
--- ```lua
--- date.setcenturyflip(0)
--- assert(date("01-01-00")==date(1900,01,01))
--- assert(date("01-01-50")==date(1950,01,01))
--- assert(date("01-01-99")==date(1999,01,01))
--- date.setcenturyflip(100)
--- assert(date("01-01-00")==date(2000,01,01))
--- assert(date("01-01-50")==date(2050,01,01))
--- assert(date("01-01-99")==date(2099,01,01))
--- date.setcenturyflip(50)
--- assert(date("01-01-00")==date(2000,01,01))
--- assert(date("01-01-49")==date(2049,01,01))
--- assert(date("01-01-50")==date(1950,01,01))
--- assert(date("01-01-99")==date(1999,01,01))
--- ```
---@param century_flip integer a number from 0 to 100 
function _M.setcenturyflip(century_flip) end

return _M

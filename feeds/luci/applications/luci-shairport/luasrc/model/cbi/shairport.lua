--[[
LuCI - Lua Configuration Interface
]]--

local fs = require "nixio.fs"

local running=(luci.sys.call("pidof shairport > /dev/null") == 0)
if running then	
	m = Map("shairport", translate("shairport"), translate("shairport is running"))
else
	m = Map("shairport", translate("shairport"), translate("shairport is not running"))
end

s = m:section(TypedSection, "shairport", "")
s.anonymous = true

switch = s:option(Flag, "enabled", translate("Enable"))
switch.rmempty = false

bname = s:option(Value, "bname", translate("Friendly Name"))
bname.optional = false

return m

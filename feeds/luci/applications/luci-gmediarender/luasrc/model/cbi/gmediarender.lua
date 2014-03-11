--[[
LuCI - Lua Configuration Interface
]]--

local fs = require "nixio.fs"

local running=(luci.sys.call("pidof gmediarender > /dev/null") == 0)
if running then	
	m = Map("gmediarender", translate("gmediarender"), translate("gmediarender is running"))
else
	m = Map("gmediarender", translate("gmediarender"), translate("gmediarender is not running"))
end

s = m:section(TypedSection, "gmediarender", "")
s.anonymous = true

switch = s:option(Flag, "enabled", translate("Enable"))
switch.rmempty = false

bname = s:option(Value, "bname", translate("Friendly Name"))
bname.optional = false

ipaddr = s:option(Value, "ipaddr", translate("Listen IP"), translate("only one, 0.0.0.0 won't work."))
ipaddr.optional = false

return m

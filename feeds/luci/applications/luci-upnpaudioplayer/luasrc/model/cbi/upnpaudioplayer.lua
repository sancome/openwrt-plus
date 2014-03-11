--[[
LuCI - Lua Configuration Interface
]]--

local fs = require "nixio.fs"

local running=(luci.sys.call("pidof upnpaudioplayer > /dev/null") == 0)
if running then	
	m = Map("upnpaudioplayer", translate("upnpaudioplayer"), translate("upnpaudioplayer is running"))
else
	m = Map("upnpaudioplayer", translate("upnpaudioplayer"), translate("upnpaudioplayer is not running"))
end

s = m:section(TypedSection, "upnpaudioplayer", "")
s.anonymous = true

switch = s:option(Flag, "enabled", translate("Enable"))
switch.rmempty = false

bname = s:option(Value, "bname", translate("Friendly Name"))
bname.optional = false

return m

--[[
LuCI - Lua Configuration Interface
]]--

local fs = require "nixio.fs"

local running=(luci.sys.call("ps | grep 'goagent' | grep -v 'grep' > /dev/null") == 0)
if running then
	m = Map("goagent", translate("goagent"), translate("goagent is running"))
else
	m = Map("goagent", translate("goagent"), translate("goagent is not running"))
end

s = m:section(TypedSection, "goagent", "")
s.anonymous = true

switch = s:option(Flag, "enabled", translate("Enable"))
switch.rmempty = false

listenip = s:option(Value, "listenip", translate("Listen IP"))
listenip.optional = false

listenport = s:option(Value, "listenport", translate("Listen Port"))
listenport.optional = false
listenport.datatype = "range(0,65535)"

appid = s:option(Value, "appid", translate("AppID"), translate("Use \"|\" to seperate each AppID."))
appid.optional = false

return m

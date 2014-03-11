--[[
LuCI - Lua Configuration Interface
]]--

m = Map("cpulimit", translate("cpulimit"),translate("cpulimit-ng"))
s = m:section(TypedSection, "list", translate("Settings"))
s.template = "cbi/tblsection"
s.anonymous = true
s.addremove = true

enable = s:option(Flag, "enabled", translate("enable", "enable"))
enable.optional = false
enable.rmempty = false

exename = s:option(Value, "exename", translate("exename"), translate("name of the executable program file or path name"))
exename.optional = false
exename.rmempty = false
exename.default = "transmission-daemon"
exename:value("transmission","transmission-daemon")
exename:value("aria2","aria2c")
exename:value("samba","smbd")
exename:value("vsftpd","vsftpd")

limit = s:option(Value, "limit", translate("limit"))
limit.optional = false
limit.rmempty = false
limit.default = "50"
limit:value("100","100%")
limit:value("90","90%")
limit:value("80","80%")
limit:value("70","70%")
limit:value("60","60%")
limit:value("50","50%")
limit:value("40","40%")
limit:value("30","30%")
limit:value("20","20%")
limit:value("10","10%")


return m

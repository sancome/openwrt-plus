--[[
LuCI - Lua Configuration Interface
]]--

module("luci.controller.vsftpd", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/vsftpd.conf") then
		return
	end

	local page
	page = entry({"admin", "services", "vsftpd"}, cbi("vsftpd"), _("vsftpd"))
	page.i18n = "vsftpd"
	page.dependent = true
end

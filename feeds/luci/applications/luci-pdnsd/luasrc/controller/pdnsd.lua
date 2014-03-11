--[[
LuCI - Lua Configuration Interface
]]--

module("luci.controller.pdnsd", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/pdnsd.conf") then
		return
	end

	local page
	page = entry({"admin", "services", "pdnsd"}, cbi("pdnsd"), _("pdnsd"))
	page.i18n = "pdnsd"
	page.dependent = true
end

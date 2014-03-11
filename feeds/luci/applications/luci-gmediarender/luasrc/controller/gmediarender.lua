--[[
LuCI - Lua Configuration Interface
]]--

module("luci.controller.gmediarender", package.seeall)

function index()

	if not nixio.fs.access("/etc/config/gmediarender") then
		return
	end

	local page
	page = entry({"admin", "services", "gmediarender"}, cbi("gmediarender"), _("gmediarender"))
	page.i18n = "gmediarender"
	page.dependent = true
end

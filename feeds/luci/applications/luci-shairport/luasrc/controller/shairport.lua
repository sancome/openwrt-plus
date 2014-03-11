--[[
LuCI - Lua Configuration Interface
]]--

module("luci.controller.shairport", package.seeall)

function index()

	if not nixio.fs.access("/etc/config/shairport") then
		return
	end

	local page
	page = entry({"admin", "services", "shairport"}, cbi("shairport"), _("shairport"))
	page.i18n = "shairport"
	page.dependent = true
end

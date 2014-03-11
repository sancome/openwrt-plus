--[[
LuCI - Lua Configuration Interface
]]--

module("luci.controller.redsocks2", package.seeall)

function index()

	local page
	page = entry({"admin", "services", "redsocks2"}, cbi("redsocks2"), _("redsocks2"))
	page.i18n = "redsocks2"
	page.dependent = true
end

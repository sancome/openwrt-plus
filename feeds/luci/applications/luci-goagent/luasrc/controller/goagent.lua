--[[
LuCI - Lua Configuration Interface
]]--

module("luci.controller.goagent", package.seeall)

function index()

	if not nixio.fs.access("/etc/config/goagent") then
		return
	end

	local page
	page = entry({"admin", "services", "goagent"}, cbi("goagent"), _("goagent"))
	page.i18n = "goagent"
	page.dependent = true
end

--[[
LuCI - Lua Configuration Interface
]]--

module("luci.controller.upnpaudioplayer", package.seeall)

function index()

	if not nixio.fs.access("/etc/config/upnpaudioplayer") then
		return
	end

	local page
	page = entry({"admin", "services", "upnpaudioplayer"}, cbi("upnpaudioplayer"), _("upnpaudioplayer"))
	page.i18n = "upnpaudioplayer"
	page.dependent = true
end

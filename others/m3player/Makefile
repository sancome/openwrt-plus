#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=m3player
PKG_VERSION:=0.1.3
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/jCoderZ/m3player.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=718d9585aff963bf328a302cc7ee088046bac8c0
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_LDFLAGS+=\
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/m3player
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=A MP3 player which implements the UPnP media renderer interface
  URL:=http://www.jcoderz.org/m3dditiez/wiki/m3ddity-player
  DEPENDS:=+libgupnp +libgupnp-av +gstreamer
endef

define Package/m3player/description
The m3player is a MP3 player with a UPnP Media Rendere interface. It can be controlled by UPnPlay on Android for example.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/m3player/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/m3player $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/hotplug.d/button
	$(CP) $(PKG_INSTALL_DIR)/etc/hotplug.d/button/buttons $(1)/etc/hotplug.d/button/

	$(INSTALL_DIR) $(1)/etc/config
	$(CP) $(PKG_INSTALL_DIR)/etc/m3player/m3player.ini $(1)/etc/config/m3player

	$(INSTALL_DIR) $(1)/usr/share/m3player
	$(CP) $(PKG_INSTALL_DIR)/usr/share/m3player/*.xml $(1)/usr/share/m3player/
endef

$(eval $(call BuildPackage,m3player))

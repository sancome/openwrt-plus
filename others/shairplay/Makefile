#
# Copyright (C) 2011 OpenWrt.org  
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# updated to work with latest source from abrasive
#

include $(TOPDIR)/rules.mk

PKG_NAME:=shairplay
PKG_VERSION:=0.9.0
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/juhovh/shairplay.git
PKG_SOURCE_VERSION:=51114600970199152e737dce64f0aa2d9e266c2c
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/shairplay
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libpthread +libavahi-client +alsa-lib +libao +mdnsd
  TITLE:=Shairplay
  URL:=https://github.com/juhovh/shairplay
endef

define Package/shairplay/description
  Free portable AirPlay server implementation similar to ShairPort.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh; ./configure );
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/shairplay
	( cd $(PKG_INSTALL_DIR); $(CP) \
		./usr/include/shairplay/* \
		$(1)/usr/include/shairplay/ \
	)
	$(INSTALL_DIR) $(1)/usr/lib
	( cd $(PKG_INSTALL_DIR); $(CP) \
		./usr/lib/libshairplay.{a,la,so*} \
		$(1)/usr/lib/ \
	)
endef

define Package/shairplay/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/shairplay $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/airport.key $(1)/etc/
endef

$(eval $(call BuildPackage,shairplay))

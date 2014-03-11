#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=platinum
PKG_VERSION:=1.0.4.11
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/badfortrains/Platinum.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=2f2cdb04de1754cc87ba900fdc927f43e86231d3
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/platinum
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libpthread +libstdcpp
  TITLE:=A framework for upnp applications
  URL:=http://Platinum.sourceforge.net
endef

define Package/platinum/description
  The Platinum Kit contains all the software packages necessary to build the 
  Platinum framework and sample applications.
endef

define Build/Configure
	cd $(PKG_BUILD_DIR)/Platinum; scons
endef

define Build/Compile

endef

define Package/platinum/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/Platinum/Targets/mips-openwrt-linux/Release/*.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,platinum))

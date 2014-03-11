#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-plugins-ugly
PKG_VERSION:=1.2.3
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/gst-plugins-ugly-$(PKG_VERSION)
PKG_SOURCE:=gst-plugins-ugly-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-plugins-ugly/
PKG_MD5SUM:=7ae60e2f759f58f32af5fcdc3c9193c4

PKG_BUILD_DEPENDS:= gstreamer gst-plugins-base liboil
PKG_CONFIG_DEPENDS:= \
	CONFIG_PACKAGE_gst-mod-asf \
	CONFIG_PACKAGE_gst-mod-lame \
	CONFIG_PACKAGE_gst-mod-mad \
	CONFIG_PACKAGE_gst-mod-mpeg2dec \
	CONFIG_PACKAGE_gst-mod-xingmux \

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gstreamer/Default
  CATEGORY:=Multimedia
  SECTION:=multimedia
  TITLE:=GStreamer
  URL:=http://gstreamer.freedesktop.org/
endef

define Package/gstreamer/description/Default
 GStreamer open source multimedia framework
endef


define Package/gst-plugins-ugly
$(call Package/gstreamer/Default)
  TITLE+= plugins collection (ugly)
  DEPENDS+= $(GST_DEPENDS)
endef

define Package/gst-plugins-ugly/description
$(call Package/gstreamer/description/Default)
 .
 This meta package contains only dependencies to the other plugins from
 the ugly plugins collection.
endef


GST_COND_SELECT = $(patsubst %,$(if $(CONFIG_PACKAGE_gst-mod-$(1)),--enable,--disable)-%,$(1))

GST_VERSION:=1.0

CONFIGURE_ARGS += \
	--disable-debug \
	--disable-examples \
	\
	--disable-a52dec \
	--disable-amrnb \
	--disable-amrwb \
	$(call GST_COND_SELECT,asf) \
	--disable-cdio \
	--disable-dvdlpcmdec \
	--disable-dvdread \
	--disable-dvdsub \
	--disable-iec958 \
	$(call GST_COND_SELECT,lame) \
	$(call GST_COND_SELECT,mad) \
	$(call GST_COND_SELECT,mpeg2dec) \
	--disable-mpegaudioparse \
	--disable-mpegstream \
	--disable-realmedia \
	--disable-sidplay \
	--disable-synaesthesia \
	--disable-twolame \
	--disable-x264 \
	$(call GST_COND_SELECT,xingmux) \
	\
	--without-libiconv-prefix \
	--without-libintl-prefix \

EXTRA_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \


define Package/gst-plugins-ugly/install
	/bin/true
endef


# 1: short name
# 2: description
# 3: dependencies on other gstreamer libraries (short name)
# 4: dependencies on other gstreamer plugins (short name)
# 5: dependencies on other packages
define GstBuildPlugin

  GST_DEPENDS += +gst-mod-$(1)

  define Package/gst-mod-$(1)
    $(call Package/gstreamer/Default)
    TITLE+= $(2) plugin (ugly)
    DEPENDS+= +libgstreamer $$(foreach p,$(3),+libgst$$(p)) $$(foreach p,$(4),+gst-mod-$$(p)) $(5)
  endef

  define Package/gst-mod-$(1)/description
   $(call Package/gstreamer/description/Default)
   .
   This package contains the GStreamer $(2) plugin.
  endef

  define Package/gst-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/gstreamer-$(GST_VERSION)
	( cd $(PKG_INSTALL_DIR); $(CP) \
		./usr/lib/gstreamer-$(GST_VERSION)/libgst$(1).so* \
		$$(1)/usr/lib/gstreamer-$(GST_VERSION)/ \
	)
  endef

  $$(eval $$(call BuildPackage,gst-mod-$(1)))
endef

$(eval $(call GstBuildPlugin,asf,ASF demuxer,audio riff rtp rtsp sdp tag,,))
$(eval $(call GstBuildPlugin,lame,MP3 encoder (using LAME),audio,,+lame-lib))
$(eval $(call GstBuildPlugin,mad,MP3 decoder (using MAD),audio tag,,+libid3tag +libmad))
$(eval $(call GstBuildPlugin,mpeg2dec,MPEG decoder,video,,+libmpeg2))
$(eval $(call GstBuildPlugin,xingmux,xingmux support,,,))

$(eval $(call BuildPackage,gst-plugins-ugly))

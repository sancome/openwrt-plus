#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gst-plugins-bad
PKG_VERSION:=1.2.3
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/gst-plugins-bad-$(PKG_VERSION)
PKG_SOURCE:=gst-plugins-bad-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://gstreamer.freedesktop.org/src/gst-plugins-bad/
PKG_MD5SUM:=cfd6f303c8df2740b27cc63b945decef

PKG_BUILD_DEPENDS:= gstreamer gst-plugins-base liboil

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


define Package/gst-plugins-bad
$(call Package/gstreamer/Default)
  TITLE+= plugins collection (bad)
  DEPENDS+= $(GST_DEPENDS)
endef

define Package/gst-plugins-bad/description
$(call Package/gstreamer/description/Default)
 .
 This meta package contains only dependencies to the other plugins from
 the bad plugins collection.
endef


GST_VERSION:=1.0

CONFIGURE_ARGS += \
	--disable-debug \
	--disable-examples \
	--disable-nls	\
	\
	--disable-directsound \
	--disable-directdraw \
	--disable-osx_video \
	--disable-quicktime \
	--disable-vcd \
	--disable-alsa \
	--disable-assrender \
	--disable-amrwb \
	--disable-apexsink \
	--disable-bz2 \
	--disable-cdaudio \
	--disable-celt \
	--disable-cog \
	--disable-dc1394 \
	--disable-directfb \
	--disable-dirac \
	--disable-dts \
	--disable-divx \
	--disable-resindvd \
	--disable-metadata \
	--disable-faac \
	--disable-faad \
	--disable-fbdev \
	--disable-flite \
	--disable-gsm \
	--disable-jack \
	--disable-jp2k \
	--disable-kate \
	--disable-ladspa \
	--disable-lv2 \
	--disable-modplug \
	--disable-mimic \
	--disable-libmms \
	--disable-mpeg2enc \
	--disable-mplex \
	--disable-musepack \
	--disable-musicbrainz \
	--disable-mythtv \
	--disable-nas \
	--disable-neon \
	--disable-ofa \
	--disable-rsvg \
	--disable-timidity \
	--disable-wildmidi \
	--disable-sdl \
	--disable-sdltest \
	--disable-sndfile \
	--disable-soundtouch \
	--disable-spc \
	--disable-gme \
	--disable-swfdec \
	--disable-theoradec \
	--disable-xvid \
	--disable-dvb \
	--disable-wininet \
	--disable-acm \
	--disable-vdpau \
	--disable-schro \
	--disable-zbar \
	--disable-vp8 \
	--disable-librfb \
	\
	--without-libiconv-prefix \
	--without-libintl-prefix \
	--without-x \

EXTRA_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \

TARGET_CFLAGS += -std=c99

define Package/gst-plugins-bad/install
	/bin/true
endef

# 1: short name
# 2: description
# 3: dependencies on other gstreamer libraries (short name)
# 4: dependencies on other packages
define GstBuildLibrary

  GST_DEPENDS += +libgst$(1)

  define Package/libgst$(1)
    $(call Package/gstreamer/Default)
    TITLE+= $(2) library (bad)
    DEPENDS+= +libgstreamer $$(foreach p,$(3),+libgst$$(p)) $(4)
  endef

  define Package/libgst$(1)/description
   $(call Package/gstreamer/description/Default)
   .
   This package contains the GStreamer $(2) library.
  endef

  define Package/libgst$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib
	( cd $(PKG_INSTALL_DIR); $(CP) \
		./usr/lib/libgst$(1)-$(GST_VERSION).so.* \
		$$(1)/usr/lib/ \
	)
  endef

  $$(eval $$(call BuildPackage,libgst$(1)))
endef

$(eval $(call GstBuildLibrary,basecamerabinsrc,basecamerabinsrc,app,))
$(eval $(call GstBuildLibrary,codecparsers,codecparsers,,))
$(eval $(call GstBuildLibrary,insertbin,insertbin,,))
$(eval $(call GstBuildLibrary,mpegts,mpegts,,))
$(eval $(call GstBuildLibrary,photography,photography,,))
$(eval $(call GstBuildLibrary,uridownloader,uridownloader,,))

# 1: short name
# 2: description
# 3: dependencies on other gstreamer libraries (short name)
# 4: dependencies on other gstreamer plugins (short name)
# 5: dependencies on other packages
define GstBuildPlugin

  GST_DEPENDS += +gst-mod-$(1)

  define Package/gst-mod-$(1)
    $(call Package/gstreamer/Default)
    TITLE+= $(2) plugin (bad)
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

$(eval $(call GstBuildPlugin,accurip,accurip support,audio,,))
$(eval $(call GstBuildPlugin,adpcmdec,adpcm decoding support,audio,,))
$(eval $(call GstBuildPlugin,adpcmenc,adpcm encoding support,audio,,))
$(eval $(call GstBuildPlugin,aiff,aiff support,audio tag,,))
$(eval $(call GstBuildPlugin,asfmux,asf muxing support,rtp,,))
$(eval $(call GstBuildPlugin,audiofxbad,audiofxbad support,audio,,))
$(eval $(call GstBuildPlugin,audiovisualizers,audiovisualizers support,audio fft video,,))
$(eval $(call GstBuildPlugin,autoconvert,autoconvert support,,,))
$(eval $(call GstBuildPlugin,bayer,bayer support,video,,))
$(eval $(call GstBuildPlugin,camerabin2,camerabin support,app basecamerabinsrc pbutils photography tag,,))
$(eval $(call GstBuildPlugin,coloreffects,coloreffects support,video,,))
$(eval $(call GstBuildPlugin,curl,curl support,,,+libcurl))
$(eval $(call GstBuildPlugin,dashdemux,dashdemux support,uridownloader,,))
$(eval $(call GstBuildPlugin,dataurisrc,dataurisrc support,,,))
$(eval $(call GstBuildPlugin,debugutilsbad,debugutilsbad support,video,,))
$(eval $(call GstBuildPlugin,decklink,decklink support,video,,+libstdcpp))
$(eval $(call GstBuildPlugin,dvbsuboverlay,dvbsuboverlay support,video,,))
$(eval $(call GstBuildPlugin,dvdspu,dvdspu support,video,,))
$(eval $(call GstBuildPlugin,festival,festival support,audio,,))
$(eval $(call GstBuildPlugin,fieldanalysis,fieldanalysis support,video,,))
$(eval $(call GstBuildPlugin,freeverb,freeverb support,audio,,))
$(eval $(call GstBuildPlugin,frei0r,frei0r support,controller video,,))
$(eval $(call GstBuildPlugin,gaudieffects,gaudieffects support,video,,))
$(eval $(call GstBuildPlugin,gdp,gdp support,,,))
$(eval $(call GstBuildPlugin,geometrictransform,geometrictransform support,video,,))
$(eval $(call GstBuildPlugin,id3tag,id3tag support,tag,,))
$(eval $(call GstBuildPlugin,inter,inter support,audio video,,))
$(eval $(call GstBuildPlugin,interlace,interlace support,video,,))
$(eval $(call GstBuildPlugin,ivtc,ivtc support,video,,))
$(eval $(call GstBuildPlugin,jpegformat,jpegformat support,tag,,))
$(eval $(call GstBuildPlugin,liveadder,liveadder support,audio,,))
$(eval $(call GstBuildPlugin,mfc,mfc support,video,,))
$(eval $(call GstBuildPlugin,midi,midi support,tag,,))
$(eval $(call GstBuildPlugin,mpegpsdemux,mpegpsdemux support,tag pbutils,,))
$(eval $(call GstBuildPlugin,mpegpsmux,mpegpsmux support,,,))
$(eval $(call GstBuildPlugin,mpegtsdemux,mpegtsdemux support,tag video mpegts pbutils,,))
$(eval $(call GstBuildPlugin,mpegtsmux,mpegtsmux support,video,,))
$(eval $(call GstBuildPlugin,mxf,mxf support,audio video,,))
$(eval $(call GstBuildPlugin,pcapparse,pcapparse support,,,))
$(eval $(call GstBuildPlugin,pnm,pnm support,video,,))
$(eval $(call GstBuildPlugin,rawparse,rawparse support,audio video,,))
$(eval $(call GstBuildPlugin,removesilence,removesilence support,,,))
$(eval $(call GstBuildPlugin,sdpelem,sdp support,rtp sdp,,))
$(eval $(call GstBuildPlugin,segmentclip,segmentclip support,audio,,))
$(eval $(call GstBuildPlugin,shm,shm support,,,+librt))
$(eval $(call GstBuildPlugin,siren,siren support,audio rtp,,))
$(eval $(call GstBuildPlugin,smooth,smooth support,video,,))
$(eval $(call GstBuildPlugin,smoothstreaming,smoothstreaming support,codecparsers tag uridownloader,,))
$(eval $(call GstBuildPlugin,speed,speed support,audio,,))
$(eval $(call GstBuildPlugin,subenc,subenc support,controller,,))
$(eval $(call GstBuildPlugin,videofiltersbad,videofiltersbad support,video,,))
$(eval $(call GstBuildPlugin,videoparsersbad,videoparsersbad support,codecparsers pbutils video,,))
$(eval $(call GstBuildPlugin,y4mdec,y4mdec support,video,,))
$(eval $(call GstBuildPlugin,yadif,yadif support,video,,))

$(eval $(call BuildPackage,gst-plugins-bad))

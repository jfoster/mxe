# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libusb-compat
$(PKG)_WEBSITE  := https://github.com/libusb/libusb-compat-0.1
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.1.7
$(PKG)_CHECKSUM := 0679ce38aa02498c1eea9c13398a0d2356883d574632a59c1e25274ed4925cf8
$(PKG)_GH_CONF  := libusb/libusb-compat-0.1/releases/latest,v
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_URL      := https://github.com/libusb/libusb-compat-0.1/releases/download/v$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(SOURCE_DIR)/configure \
        $(MXE_CONFIGURE_OPTS)
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install
    ln -sf '$(PREFIX)/$(TARGET)/include/usb.h' '$(PREFIX)/$(TARGET)/include/lusb0_usb.h'
endef
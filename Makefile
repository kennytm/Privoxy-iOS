_THEOS_PLATFORM_DPKG_DEB = /usr/local/opt/dpkg/libexec/bin/dpkg-deb
# ^ see https://github.com/theos/theos/issues/188

TARGET := iphone:10.1:7.0

THEOS_DEVICE_IP ?= 127.0.0.1
ifeq ($(THEOS_DEVICE_IP), 127.0.0.1)
	THEOS_DEVICE_PORT ?= 2222
endif

include $(THEOS)/makefiles/common.mk

TOOL_NAME = privoxy
privoxy_CFLAGS = -I. -Isrc -Isrc/pcre -Wno-builtin-memcpy-chk-size -Wno-format -Wno-error=\#warnings
privoxy_FILES = $(wildcard src/[a-v]*.c) src/pcre/pcre.c src/pcre/pcreposix.c src/pcre/study.c

include $(THEOS_MAKE_PATH)/tool.mk

before-privoxy-stage::
	mkdir -p $(THEOS_STAGING_DIR)/etc/privoxy
	grep -v '^#MASTER#' src/default.action.master > $(THEOS_STAGING_DIR)/etc/privoxy/default.action
	cp -r src/{config,default.filter,match-all.action,trust,user.action,user.filter,templates} $(THEOS_STAGING_DIR)/etc/privoxy

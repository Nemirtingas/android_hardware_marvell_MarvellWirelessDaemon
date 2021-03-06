#
# Copyright (C) 2018 The LineageOS Project
#                     Nemirtingas <nanaki89@hotmail.fr>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := \

LOCAL_SRC_FILES := \
        marvell_wireless_daemon.c

#ifeq ($(shell if [ $(PLATFORM_SDK_VERSION) -ge 9 ]; then echo big9; fi),big9)
#LOCAL_C_INCLUDES := \
#        external/bluetooth/bluez/lib
#else
#LOCAL_C_INCLUDES := \
#        external/bluetooth/bluez/include
#endif

LOCAL_SHARED_LIBRARIES := \
    libc\
    libcutils \
    libutils \
    libnetutils
#    libbluetooth

LOCAL_MODULE:=MarvellWirelessDaemon
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror
ifdef SD8887_NEED_CALIBRATE
LOCAL_CFLAGS += -DSD8887_NEED_CALIBRATE
endif

LOCAL_CFLAGS += -DSD8887_CAL_ON_BOARD
# Make symlinks from /system/etc/firmware/mrvl to /data/misc/wireless
CONFIGS := \
	wifi_init_cfg.conf \
	bt_init_cfg.conf
SYMLINKS := $(addprefix $(TARGET_OUT)/etc/firmware/mrvl/,$(CONFIGS))
$(SYMLINKS): CAL_BINARY := /data/misc/wireless
$(SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(CAL_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(CAL_BINARY)/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)

# We need this so that the installed files could be picked up based on the
# local module name
ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
    $(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(SYMLINKS)

include $(BUILD_EXECUTABLE)

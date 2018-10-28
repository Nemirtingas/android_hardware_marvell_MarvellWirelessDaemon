#
# Copyright (C) 2016 Android For Marvell Project <ctx.xda@gmail.com>
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

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM), mrvl)
ifeq ($(TARGET_BOARD_SOC), pxa1908)

pxa_dirs := MarvellWirelessDaemon
pxa_dirs += libMarvellWireless
pxa_dirs += wlan
#pxa_dirs += libhardware_legacy

include $(call all-named-subdir-makefiles,$(pxa_dirs))

endif
endif

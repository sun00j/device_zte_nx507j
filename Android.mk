#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),NX507J)
include $(call all-makefiles-under,$(LOCAL_PATH))

FIRMWARE_VENUS_IMAGES := \
    venus.b00 venus.b01 venus.b02 venus.b03 venus.b04 venus.mdt
FIRMWARE_VENUS_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_VENUS_IMAGES)))
$(FIRMWARE_VENUS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Venus Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@
ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_VENUS_SYMLINKS)

FIRMWARE_WCD9306_IMAGES := \
    mbhc.bin wcd9320_anc.bin
FIRMWARE_WCD9306_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/wcd9306/,$(notdir $(FIRMWARE_WCD9306_IMAGES)))
$(FIRMWARE_WCD9306_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WCD9306 Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/audio/$(notdir $@) $@
ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_WCD9306_SYMLINKS)
endif

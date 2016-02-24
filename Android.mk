#
# Copyright 2012 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

ifneq ($(filter geehrc,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(call first-makefiles-under,$(LOCAL_PATH))

# This is ugly for more reasons than I can mention. Don't think
# that this is a good idea. It's not. It's horrible. It's truly
# entirely horrible. It's not an elegant hack in any way.

$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9310; \
	ln -sf /data/misc/audio/wcd9310_anc.bin \
	$(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_anc.bin; \
	ln -sf /data/misc/audio/mbhc.bin \
	$(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_mbhc.bin)

# Symlink firmware from /persist
FIRMWARE_IMAGES := dsps.mdt dsps.b00 dsps.b01 dsps.b02 dsps.b03 dsps.b04 dsps.b05
FIRMWARE_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_IMAGES)))
$(FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_SYMLINKS)

endif


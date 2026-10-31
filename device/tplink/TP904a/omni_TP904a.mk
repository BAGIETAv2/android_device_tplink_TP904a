#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TeamWin Recovery Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from custom configuration if available
$(call inherit-product-if-exists, vendor/omni/config/common.mk)
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

# Copy init and ueventd files to recovery root
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6755.rc:root/init.recovery.mt6755.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6750.rc:root/init.recovery.mt6750.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.mt6755.rc:root/ueventd.mt6755.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.mt6750.rc:root/ueventd.mt6750.rc

# Device identifier
PRODUCT_DEVICE := TP904a
PRODUCT_NAME := omni_TP904a
PRODUCT_BRAND := Neffos
PRODUCT_MODEL := Neffos X1 Lite
PRODUCT_MANUFACTURER := TP-Link
PRODUCT_RELEASE_NAME := TP904a

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=TP904A \
    BUILD_PRODUCT=TP904A \
    TARGET_DEVICE=TP904a

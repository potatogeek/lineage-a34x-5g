#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from a34x device
$(call inherit-product, device/samsung/a34x/device.mk)

PRODUCT_DEVICE := a34x
PRODUCT_NAME := lineage_a34x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A346B
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a34xxx-user 14 UP1A.231005.007 A346BXXU6CXD5 release-keys"

BUILD_FINGERPRINT := samsung/a34xxx/a34x:14/UP1A.231005.007/A346BXXU6CXD5:user/release-keys

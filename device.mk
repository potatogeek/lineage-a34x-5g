#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a34x

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# API levels
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Bluetooth
PRODUCT_PACKAGES += \
    audio.sysbta.default \
    android.hardware.bluetooth.audio-service-system

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration.xml \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration_7_0.xml

# Boot animation 
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Charger
PRODUCT_PACKAGES += \
    charger_res_images_vendor \
    $(DEVICE_PATH)/init/init.sec-charger.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.sec-charger.rc \
    libsuspend

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhardware \
    libhwbinder

#LPM
PRODUCT_PACKAGES += \
    system_ext_31.0.cil

# MTK
PRODUCT_PACKAGES += \
    MtkInCallService 

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResOverlay_a34x \
    SystemUIOverlay_a34x
    
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Product characteristics
PRODUCT_CHARACTERISTICS := phone

# Rootdir
PRODUCT_PACKAGES += \
    fstab.mt6877 \
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.audio.samsung.rc \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6877.rc \
    init.mt6877.usb.rc \
    init.project.rc \
    init.sec.rc \
    init_conninfra.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    meta_init.vendor.rc \
    multi_init.rc \
    init.recovery.mt6877.rc \
    init.recovery.samsung.rc 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6877:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6877

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/samsung_ext

# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a34x/a34x-vendor.mk)

# Inherit the sign keys
#$(call inherit-product, vendor/lineage-priv/keys/keys.mk)


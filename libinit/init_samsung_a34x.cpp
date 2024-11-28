/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_variant.h>
#include <libinit_utils.h>
#include <unistd.h>

#include "vendor_init.h"

static const variant_info_t a34x_info = {
    .hwc_value = "",
    .sku_value = "a34x",

    .brand = "Samsung",
    .device = "a34x",
    .marketname = "Samsung Galaxy A34",
    .model = "SM-A346B",
    .build_fingerprint = "samsung/a34xxx/a34x:14/UP1A.231005.007/A346BXXU6CXD5:user/release-keys"
};

static const variant_info_t a34x2_info = {
    .hwc_value = "",
    .sku_value = "a34x",

    .brand = "Samsung",
    .device = "a34x",
    .marketname = "Samsung Galaxy A34",
    .model = "SM-A346B",
    .build_fingerprint = "samsung/a34xxx/a34x:14/UP1A.231005.007/A346BXXU6CXD5:user/release-keys"
};


static const std::vector<variant_info_t> variants = {
    a34x_info,
};

void vendor_load_properties() {
    if (access("/system/bin/recovery", F_OK) != 0) {
        search_variant(variants);
    }
}

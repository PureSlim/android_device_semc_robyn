#!/bin/sh

VENDOR=semc
DEVICE=robyn

mkdir -p ../../../vendor/$VENDOR/$DEVICE

(cat << EOF) | sed -e s/__DEVICE__/$DEVICE/g -e s/__VENDOR__/$VENDOR/g  > ../../../vendor/$VENDOR/$DEVICE/device_$DEVICE-vendor.mk
# This file is generated by device/__VENDOR__/__DEVICE__/setup-makefiles.sh

# Live wallpaper packages
PRODUCT_PACKAGES := \\
    LiveWallpapersPicker \\
    MagicSmokeWallpapers \\
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES := \\
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := vendor/__VENDOR__/__DEVICE__/overlay

\$(call inherit-product, vendor/__VENDOR__/__DEVICE__/device___DEVICE__-vendor-blobs.mk)
EOF

(cat << EOF) | sed -e s/__DEVICE__/$DEVICE/g -e s/__VENDOR__/$VENDOR/g > ../../../vendor/$VENDOR/$DEVICE/BoardConfigVendor.mk

# This file is generated by device/__VENDOR__/__DEVICE__/setup-makefiles.sh

BOARD_GPS_LIBRARIES := libgps librpc

USE_CAMERA_STUB := false

EOF

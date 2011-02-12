#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=x10mini

mkdir -p ../../../vendor/htc/$DEVICE/proprietary

unzip -j -o ../../../${DEVICE}_update.zip -d ../../../vendor/htc/$DEVICE/proprietary \
    system/bin/akmd2 \\
    system/system/bin/mm-venc-omx-test \\
    system/etc/01_qcomm_omx.cfg \\
    system/etc/firmware/TIInit_7.2.31.bts \\
    system/etc/firmware/fm_rx_init_1273.1.bts \\
    system/etc/firmware/fm_rx_init_1273.2.bts \\
    system/etc/firmware/fm_tx_init_1273.1.bts \\
    system/etc/firmware/fm_tx_init_1273.2.bts \\
    system/etc/firmware/fmc_init_1273.1.bts \\
    system/etc/firmware/fmc_init_1273.2.bts \\
    system/etc/firmware/yamato_pfp.fw \\
    system/etc/firmware/yamato_pm4.fw \\
    system/lib/egl/libEGL_adreno200.so \\
    system/lib/egl/libGLESv1_CM_adreno200.so \\
    system/lib/egl/libGLESv2_adreno200.so \\
    system/lib/egl/libGLES_qcom.so \\
    system/lib/egl/libq3dtools_adreno200.so \\
    system/lib/libcamera.so \\
    system/lib/libgps.so \\
    system/lib/libgsl.so \\
    system/lib/libril-qc-1.so \\
    system/lib/liboemcamera.so \\
    system/lib/libfm_stack.so \\
    system/lib/hw/gralloc.msm7k.so \\
    system/lib/libaudioeq.so \\
    #system/lib/libreference-ril.so \\
    #system/etc/AudioFilter.csv \\
    system/lib/libmm-adspsvc.so \\
    system/lib/libOmxCore.so \\
    system/lib/libOmxH264Dec.so \\
    system/lib/libOmxMpeg4Dec.so \\
    system/lib/libOmxVidEnc.so
	 
chmod 755 ../../../vendor/htc/$DEVICE/proprietary/akmd2

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/htc/$DEVICE/device_$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# This file is generated by device/htc/__DEVICE__/extract-files.sh

PRODUCT_COPY_FILES := \\
    vendor/htc/__DEVICE__/proprietary/libgps.so:obj/lib/libgps.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:obj/lib/libcamera.so

PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/akmd2:system/bin/akmd2 \\
    vendor/htc/__DEVICE__/proprietary/mm-venc-omx-test:system/system/bin/mm-venc-omx-test \\
    vendor/htc/__DEVICE__/proprietary/01_qcomm_omx.cfg:system/etc/01_qcomm_omx.cfg \\
    vendor/htc/__DEVICE__/proprietary/TIInit_7.2.31.bts:system/etc/firmware/TIInit_7.2.31.bts \\
    vendor/htc/__DEVICE__/proprietary/fm_rx_init_1273.1.bts:system/etc/firmware/fm_rx_init_1273.1.bts \\
    vendor/htc/__DEVICE__/proprietary/fm_rx_init_1273.2.bts:system/etc/firmware/fm_rx_init_1273.2.bts \\
    vendor/htc/__DEVICE__/proprietary/fm_tx_init_1273.1.bts:system/etc/firmware/fm_tx_init_1273.1.bts \\
    vendor/htc/__DEVICE__/proprietary/fm_tx_init_1273.2.bts:system/etc/firmware/fm_tx_init_1273.2.bts \\
    vendor/htc/__DEVICE__/proprietary/fmc_init_1273.1.bts:system/etc/firmware/fmc_init_1273.1.bts \\
    vendor/htc/__DEVICE__/proprietary/fmc_init_1273.2.bts:system/etc/firmware/fmc_init_1273.2.bts \\
    vendor/htc/__DEVICE__/proprietary/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \\
    vendor/htc/__DEVICE__/proprietary/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \\
    vendor/htc/__DEVICE__/proprietary/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLES_qcom.so:system/lib/egl/libGLES_qcom.so \\
    vendor/htc/__DEVICE__/proprietary/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:system/lib/libcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libgps.so:system/lib/libgps.so \\
    vendor/htc/__DEVICE__/proprietary/libgsl.so:system/lib/libgsl.so \\
    vendor/htc/__DEVICE__/proprietary/libril-qc-1.so:system/lib/libril-qc-1.so \\
    vendor/htc/__DEVICE__/proprietary/liboemcamera.so:system/lib/liboemcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libfm_stack.so:system/lib/libfm_stack.so \\
    vendor/htc/__DEVICE__/proprietary/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \\
    vendor/htc/__DEVICE__/proprietary/libaudioeq.so:system/lib/libaudioeq.so \\
    #vendor/htc/__DEVICE__/proprietary/libreference-ril.so:system/lib/libreference-ril.so \\
    #vendor/htc/__DEVICE__/proprietary/AudioFilter.csv:system/etc/AudioFilter.csv \\
    vendor/htc/__DEVICE__/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxCore.so:system/lib/libOmxCore.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so

PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/tiwlan_drv.ko:system/lib/modules/tiwlan_drv.ko \\
    vendor/htc/__DEVICE__/proprietary/sdio.ko:system/lib/modules/sdio.ko
EOF

./setup-makefiles.sh

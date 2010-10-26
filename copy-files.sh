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

DEVICE=buzz
STAGESYS=~/cm6-$DEVICE/system

if [ "$1" = "pull" ]; then
  if [ -s "$STAGESYS" ]; then
  rm -R ~/cm6-$DEVICE
  fi
 mkdir ~/cm6-$DEVICE
 mkdir $STAGESYS
 mkdir $STAGESYS/bin
 mkdir $STAGESYS/lib
 mkdir $STAGESYS/etc
 adb pull /system/bin $STAGESYS/bin
 adb pull /system/lib $STAGESYS/lib
 adb pull /system/etc $STAGESYS/etc
fi

mkdir -p ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/bin/akmd ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/AudioFilter.csv ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/AudioPara4.csv ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/AudioPreProcess.csv ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/agps_rm ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/pvasflocal.cfg ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/spn-conf.xml ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/voicemail-conf.xml ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/etc/wifi/wpa_supplicant.conf ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/egl/libGLES_android.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/egl/libGLES_qcom.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/hw/lights.msm7k.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/hw/sensors.buzz.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libGLESv1_CM.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libGLESv2.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libOmxCore.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libOmxH264Dec.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libOmxMpeg4Dec.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libOmxVidEnc.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libaudioeq.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libaudioeq.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libcamera.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libgps.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libhtc_acoustic.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libhtc_ril.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libmm-adspsvc.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libmm-adspsvc.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/liboemcamera.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libpvasfcommon.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libpvasflocalpb.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libpvasflocalpbreg.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libspeech.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/lib/libt9.so ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/usr/keychars/qwerty.kcm.bin ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/usr/keychars/qwerty2.kcm.bin ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/usr/keylayout/buzz-keypad.kl ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/usr/keylayout/h2w_headset.kl ../../../vendor/htc/$DEVICE/proprietary
cp $STAGESYS/usr/keylayout/qwerty.kl ../../../vendor/htc/$DEVICE/proprietary

chmod 755 ../../../vendor/htc/$DEVICE/proprietary/akmd

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/htc/$DEVICE/$DEVICE-vendor-blobs.mk
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


# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/custom/logo.rle:root/logo.rle \\
    vendor/htc/__DEVICE__/proprietary/libgps.so:obj/lib/libgps.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:obj/lib/libcamera.so

# proprietary stuff
PRODUCT_COPY_FILES += \\
	vendor/htc/__DEVICE__/proprietary/AudioPara4.csv:system/etc/AudioPara4.csv \\
	vendor/htc/__DEVICE__/proprietary/AudioFilter.csv:system/etc/AudioFilter.csv \\
	vendor/htc/__DEVICE__/proprietary/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \\
	vendor/htc/__DEVICE__/proprietary/libaudioeq.so:system/lib/libaudioeq.so \\
	vendor/htc/__DEVICE__/proprietary/libGLESv1_CM.so:system/lib/libGLESv1_CM.so \\
	vendor/htc/__DEVICE__/proprietary/libGLESv2.so:system/lib/libGLESv2.so \\
	vendor/htc/__DEVICE__/proprietary/libGLES_qcom.so:system/lib/egl/libGLES_qcom.so \\
	vendor/htc/__DEVICE__/proprietary/libgps.so:system/lib/libgps.so \\
	vendor/htc/__DEVICE__/proprietary/liboemcamera.so:system/lib/liboemcamera.so \\
	vendor/htc/__DEVICE__/proprietary/libcamera.so:system/lib/libcamera.so \\
	vendor/htc/__DEVICE__/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
	vendor/htc/__DEVICE__/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
	vendor/htc/__DEVICE__/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
	vendor/htc/__DEVICE__/proprietary/libOmxCore.so:system/lib/libOmxCore.so \\
	vendor/htc/__DEVICE__/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \\
    	vendor/htc/__DEVICE__/proprietary/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \\
    	vendor/htc/__DEVICE__/proprietary/libhtc_ril.so:system/lib/libhtc_ril.so \\
    	vendor/htc/__DEVICE__/proprietary/buzz-keypad.kl:system/usr/keylayout/buzz-keypad.kl \\
    	vendor/htc/__DEVICE__/proprietary/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \\
    	vendor/htc/__DEVICE__/proprietary/qwerty.kl:system/usr/keylayout/qwerty.kl \\
	vendor/htc/__DEVICE__/proprietary/agps_rm:system/etc/agps_rm \\
	vendor/htc/__DEVICE__/proprietary/libt9.so:system/lib/libt9.so \\
	vendor/htc/__DEVICE__/proprietary/voicemail-conf.xml:system/etc/voicemail-conf.xml \\
	vendor/htc/__DEVICE__/proprietary/spn-conf.xml:system/etc/spn-conf.xml \\
	vendor/htc/__DEVICE__/proprietary/sensors.buzz.so:system/lib/hw/sensors.buzz.so \\
	vendor/htc/__DEVICE__/proprietary/lights.msm7k.so:system/lib/hw/lights.msm7k.so \\
	vendor/htc/__DEVICE__/proprietary/libpvasfcommon.so:system/lib/libpvasfcommon.so \\
	vendor/htc/__DEVICE__/proprietary/libpvasflocalpb.so:system/lib/libpvasflocalpb.so \\
	vendor/htc/__DEVICE__/proprietary/libpvasflocalpbreg.so:system/lib/libpvasflocalpbreg.so \\
	vendor/htc/__DEVICE__/proprietary/pvasflocal.cfg:system/etc/pvasflocal.cfg \\
	vendor/htc/__DEVICE__/proprietary/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \\
	vendor/htc/__DEVICE__/proprietary/akmd:system/bin/akmd \\
	vendor/htc/__DEVICE__/proprietary/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \\
	vendor/htc/__DEVICE__/proprietary/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \\
	device/htc/buzz/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \\
	device/htc/buzz/firmware/proprietary/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \\
	device/htc/buzz/firmware/proprietary/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

EOF

./setup-makefiles.sh

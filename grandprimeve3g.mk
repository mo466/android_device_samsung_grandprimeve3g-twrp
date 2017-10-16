LOCAL_PATH := device/samsung/grandprimeve3g

# Хакатон для билда
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif	


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel:kernel \
    $(LOCAL_PATH)/dt.img:dt.img \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/ramdisk/ueventd.sc8830.rc:recovery/root/ueventd.sc8830.rc \
    $(LOCAL_PATH)/ramdisk/lib/modules/autotst.ko:recovery/root/lib/modules/autotst.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/mmc_test.ko:recovery/root/lib/modules/mmc_test.ko

PRODUCT_CHARACTERISTICS := phone

$(call inherit-product, build/target/product/full.mk)

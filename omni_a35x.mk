#
# omni_a35x.mk - SHRP/Omni A35x fixed
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

$(call inherit-product-if-exists, vendor/shrp/config/common.mk)

$(call inherit-product, device/samsung/a35x/device.mk)

PRODUCT_DEVICE := a35x
PRODUCT_NAME := omni_a35x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A356E
PRODUCT_MANUFACTURER := samsung

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/a35x/recovery/root,recovery/root)

PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_GMS_CLIENTID_BASE := android-samsung

SHRP_MAINTAINER := ChristyGaming18

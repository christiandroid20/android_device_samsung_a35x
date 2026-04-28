#
# Omni / SHRP compatible build file for Samsung A35x
# Converted from twrp_a35x
#

# 📦 Core Android base
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# ⚙️ Emulated storage (required for modern Samsung)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# 🔥 SHRP / Recovery base (only SHRP - remove conflicts)
$(call inherit-product-if-exists, vendor/shrp/config/common.mk)

# 📱 Device tree base
$(call inherit-product, device/samsung/a35x/device.mk)

# 🧠 Device identity (IMPORTANT FOR LUNCH)
PRODUCT_DEVICE := a35x
PRODUCT_NAME := omni_a35x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A356E
PRODUCT_MANUFACTURER := samsung

# 📂 Recovery ramdisk files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/a35x/recovery/root,recovery/root)

# 🔋 Charger images (optional but safe)
PRODUCT_PACKAGES += \
    charger_res_images

# 🌐 Google client ID (optional, harmless)
PRODUCT_GMS_CLIENTID_BASE := android-samsung

SHRP_MAINTAINER := ChristyGaming18

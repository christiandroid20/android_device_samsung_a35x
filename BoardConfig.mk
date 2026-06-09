#
# BoardConfig.mk - Samsung A35x SHRP/TWRP FIXED
#

DEVICE_PATH := device/samsung/a35x

ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# ============================================================
# ARCHITECTURE
# ============================================================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

# ============================================================
# PLATFORM
# ============================================================
BOARD_VENDOR := samsung
TARGET_SOC := s5e8835
TARGET_BOOTLOADER_BOARD_NAME := s5e8835
TARGET_BOARD_PLATFORM := erd8835

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true
TARGET_USES_64_BIT_BINDER := true

# ============================================================
# DISPLAY
# ============================================================
TW_THEME := portrait_hdpi
TARGET_SCREEN_DENSITY := 390
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2340

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"

# ============================================================
# KERNEL (PREBUILT)
# ============================================================
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_BOOT_HEADER_VERSION := 3

BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 4096

BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive loop.max_part=7 androidboot.hardware=samsung

BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x1000000

BOARD_MKBOOTIMG_ARGS := \
    --header_version $(BOARD_BOOT_HEADER_VERSION) \
    --pagesize $(BOARD_KERNEL_PAGESIZE) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
    --dtb $(TARGET_PREBUILT_DTB) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --board "SRPWK02A003"

BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg/mkbootimg.mk

# ============================================================
# PARTITIONS (CRITICAL FIX AREA)
# ============================================================
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm vendor_dlkm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

BOARD_AVB_ENABLE := false

# ============================================================
# SYSTEM-AS-ROOT FIX (IMPORTANT FOR FIRST_STAGE_MOUNT)
# ============================================================
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_ROOT_EXTRA_FOLDERS := metadata mnt system system_ext vendor product odm vendor_dlkm

# ============================================================
# RECOVERY
# ============================================================
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

TW_INCLUDE_FASTBOOTD := true
TW_USE_NEW_MINADBD := true
RECOVERY_SDCARD_ON_DATA := true

# ============================================================
# SHRP
# ============================================================
ifeq ($(USE_RECOVERY),SHRP)
SHRP_DEVICE_CODE := a35x
SHRP_MAINTAINER := ChristyGaming18
SHRP_AB := true
SHRP_REC_TYPE := Treble
SHRP_HAS_RECOVERY_PARTITION := true
SHRP_EDL_MODE := 1
endif

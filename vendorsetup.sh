#
# vendorsetup.sh - Samsung A35x (Fixed SHRP / OrangeFox compatible)
#

# ============================================================
# BASIC BUILD FLAGS
# ============================================================
export ALLOW_MISSING_DEPENDENCIES=true

# Device name (important for lunch/build detection)
FDEVICE="a35x"

# ============================================================
# DEVICE DETECTION (SIMPLIFIED)
# ============================================================
if [ "$1" = "$FDEVICE" ] || [ "$USE_RECOVERY" = "$FDEVICE" ]; then

    export FOX_BUILD_DEVICE="$FDEVICE"

    # ========================================================
    # CORE BUILD ENV
    # ========================================================
    export TARGET_ARCH=arm64
    export LC_ALL="C"

    # ========================================================
    # RECOVERY FLAGS (SAFE DEFAULTS)
    # ========================================================
    export OF_USE_MAGISKBOOT=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

    export OF_HIDE_NOTCH=1
    export OF_ADVANCED_SECURITY=1

    export OF_ALLOW_DISABLE_NAVBAR=0

    # ========================================================
    # DECRYPTION / STORAGE FIXES
    # ========================================================
    export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
    export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
    export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1

    # ========================================================
    # UI (A35x 2340p correct)
    # ========================================================
    export OF_SCREEN_H=2340
    export OF_STATUS_H=80
    export OF_STATUS_INDENT_LEFT=80
    export OF_STATUS_INDENT_RIGHT=80

    # ========================================================
    # MAINTAINER
    # ========================================================
    export OF_MAINTAINER="ChristyGaming18"
    export FOX_BUILD_TYPE="Beta"
    export FOX_VARIANT="AOSP"

    # ========================================================
    # FEATURES
    # ========================================================
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export OF_ENABLE_LPTOOLS=1

    export FOX_USE_BASH_SHELL=1
    export FOX_USE_NANO_EDITOR=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_USE_SED_BINARY=1

    export OF_RUN_POST_FORMAT_PROCESS=1
    export OF_UNBIND_SDCARD_F2FS=1

    # ========================================================
    # PARTITION (SAFE SAMSUNG PATH)
    # ========================================================
    export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/bootdevice/by-name/recovery"

    # ========================================================
    # LOGGING (CI SAFE)
    # ========================================================
    if [ -n "$FOX_BUILD_LOG_FILE" ] && [ -f "$FOX_BUILD_LOG_FILE" ]; then
        export | grep -E "FOX|OF_|TARGET_" >> "$FOX_BUILD_LOG_FILE"
    fi

fi

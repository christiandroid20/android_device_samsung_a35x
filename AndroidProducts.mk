#
# AndroidProducts.mk - TWRP + SHRP (dual support)
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_a35x.mk \
    $(LOCAL_DIR)/omni_a35x.mk

COMMON_LUNCH_CHOICES := \
    twrp_a35x-eng \
    omni_a35x-eng

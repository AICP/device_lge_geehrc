# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 768

# Boot animation
#PRODUCT_COPY_FILES += \
#    vendor/nitrogen/prebuilt/common/bootanimations/bootanimation_geehrc.zip:system/media/bootanimation.zip

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/nitrogen/products/common.mk)

# Inherit device configuration
$(call inherit-product, device/lge/geehrc/full_geehrc.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := geehrc
PRODUCT_NAME := nitrogen_geehrc
PRODUCT_BRAND := LGE
PRODUCT_MODEL := Optimus G
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false

#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=nitrogen_geehrc-marshmallow
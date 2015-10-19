# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 768

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/chroma/prebuilt/shamu/system/media/bootanimation.zip:system/media/bootanimation.zip

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/chroma/products/common.mk)

# Inherit device configuration
$(call inherit-product, device/lge/geehrc/full_geehrc.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := geehrc
PRODUCT_NAME := chroma_geehrc
PRODUCT_BRAND := LGE
PRODUCT_MODEL := Optimus G
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false

# Extra packages
PRODUCT_PACKAGES += \
    Launcher3 \
    Stk \
    Busybox \
    messaging \
    Camera2 \
    Calendar \
    DeskClock \
    Email


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=chroma_geehrc-marshmallow
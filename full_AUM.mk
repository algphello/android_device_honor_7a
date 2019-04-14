$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \

# sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true \
    ro.crypto.state=encrypted \
    ro.crypto.type=file

#$(shell mkdir -p $(OUT)/recovery/)
#$(shell mkdir -p $(OUT)/recovery/root/)
#$(shell touch $(OUT)/recovery/root/file_contexts)

#Hackery
$(shell mkdir -p $(OUT)/obj/ETC/sepolicy.recovery_intermediates)
$(shell mkdir -p $(OUT)obj/ETC/sepolicy_intermediates) 
$(shell cp device/honor/AUM/sepolicy $(OUT)/obj/ETC/sepolicy.recovery_intermediates/sepolicy.recovery)
$(shell cp device/honor/AUM/sepolicy $(OUT)/obj/ETC/sepolicy_intermediates/sepolicy)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720


# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:root/fstab.qcom

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := AUM
PRODUCT_NAME := full_AUM
PRODUCT_BRAND := Honor
PRODUCT_MODEL := 7A
PRODUCT_MANUFACTURER := Huawei

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
ro.product.model

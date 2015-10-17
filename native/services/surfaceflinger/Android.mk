LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CLANG := true

LOCAL_MODULE                    := libexsurfaceflinger
LOCAL_MODULE_TAGS               := optional
LOCAL_MODULE_OWNER              := qti

LOCAL_PROPRIETARY_MODULE        := false
LOCAL_CFLAGS                    := -DLOG_TAG=\"ExSurfaceFlinger\"
LOCAL_CFLAGS                    += -DHAS_CONTEXT_PRIORITY

LOCAL_C_INCLUDES                += $(TARGET_OUT_HEADERS)
LOCAL_C_INCLUDES                += hardware/qcom/display-caf/$(TARGET_BOARD_PLATFORM)/libgralloc \
                                   hardware/qcom/display-caf/$(TARGET_BOARD_PLATFORM)/libqdutils \
                                   frameworks/native/services/surfaceflinger

LOCAL_SHARED_LIBRARIES          := libsurfaceflinger libui libgui libqdutils \
                                   libbinder libutils libcutils \
                                   libandroid

LOCAL_SRC_FILES                 := ExLayer.cpp \
                                   ExSurfaceFlinger.cpp \
                                   DisplayHardware/ExVirtualDisplaySurface.cpp \
                                   DisplayHardware/ExHWComposer.cpp

include $(BUILD_STATIC_LIBRARY)

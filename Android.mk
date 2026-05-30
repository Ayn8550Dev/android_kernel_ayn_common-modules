# Android makefile for display kernel modules

MOORECHIP_DLKM_ENABLE := true
ifeq ($(TARGET_KERNEL_DLKM_DISABLE), true)
       ifeq ($(TARGET_KERNEL_DLKM_MOORECHIP_OVERRIDE), false)
               MOORECHIP_DLKM_ENABLE := false
       endif
endif

ifeq ($(MOORECHIP_DLKM_ENABLE),  true)
       MOORECHIP_SELECT := CONFIG_MSM_MOORECHIP=m
       BOARD_OPENSOURCE_DIR ?= vendor/qcom/opensource
       BOARD_COMMON_DIR ?= device/qcom/common

       LOCAL_PATH := $(call my-dir)

       include $(CLEAR_VARS)

       # This makefile is only for DLKM
       ifneq ($(findstring vendor,$(LOCAL_PATH)),)

       ifneq ($(findstring opensource,$(LOCAL_PATH)),)
               MOORECHIP_BLD_DIR := $(shell pwd)/$(BOARD_OPENSOURCE_DIR)/moorechip-drivers
       endif # opensource

       DLKM_DIR := $(TOP)/$(BOARD_COMMON_DIR)/dlkm

       LOCAL_ADDITIONAL_DEPENDENCIES := $(wildcard $(LOCAL_PATH)/**/*) $(wildcard $(LOCAL_PATH)/*)

       # Build
       ###########################################################
       # This is set once per LOCAL_PATH, not per (kernel) module
       KBUILD_OPTIONS := MOORECHIP_ROOT=$(MOORECHIP_BLD_DIR)

       KBUILD_OPTIONS += MODNAME=moorechip_dlkm
       KBUILD_OPTIONS += BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)
       KBUILD_OPTIONS += $(MOORECHIP_SELECT)

       ###########################################################

       endif # DLKM check
endif

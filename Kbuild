KDIR := $(TOP)/kernel_platform/common

include $(MOORECHIP_ROOT)/config/gki_moorechip.conf
LINUX_INC += -include $(MOORECHIP_ROOT)/config/gki_moorechipconf.h

LINUX_INC +=	-Iinclude/linux \
		-Iinclude/linux/drm \
		-Iinclude/linux/gunyah \
		-Iinclude/linux/input

CDEFINES +=	-DANI_LITTLE_BYTE_ENDIAN \
	-DANI_LITTLE_BIT_ENDIAN \
	-DDOT11F_LITTLE_ENDIAN_HOST \
	-DANI_COMPILER_TYPE_GCC \
	-DANI_OS_TYPE_ANDROID=6 \
	-DPTT_SOCK_SVC_ENABLE \
	-Wall\
	-Werror\
	-D__linux__

KBUILD_CPPFLAGS += $(CDEFINES)

ccflags-y += $(LINUX_INC)

ifeq ($(call cc-option-yn, -Wmaybe-uninitialized),y)
EXTRA_CFLAGS += -Wmaybe-uninitialized
endif

ifeq ($(call cc-option-yn, -Wheader-guard),y)
EXTRA_CFLAGS += -Wheader-guard
endif

######### CONFIG_MSM_MOORECHIP ########

ifeq ($(CONFIG_LEDS_SN3112), y)
	obj-$(CONFIG_MSM_MOORECHIP) += leds-sn3112.o
endif

ifeq ($(CONFIG_LEDS_HTR3212), y)
	obj-$(CONFIG_MSM_MOORECHIP) += leds-htr3212.o
endif

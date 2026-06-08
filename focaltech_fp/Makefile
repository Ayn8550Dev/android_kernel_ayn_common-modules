# Makefile for the focaltech fingerprint driver.

#=======================================================================
# Project configurations, should be configured based on your projects

# If TEE is emulation which is called REE, you should set it to y
CONFIG_FINGERPRINT_FOCALTECH_TEE_REE := n


#==========================================================================
# source files and ccflags
# obj-$(CONFIG_FINGERPRINT_FOCALTECH) := focaltech_fp.o
obj-y := focaltech_fp.o
focaltech_fp-y := ff_core.o

ifeq ($(CONFIG_FINGERPRINT_FOCALTECH_TEE_REE),y)
ccflags-y += -DCONFIG_FINGERPRINT_FOCALTECH_TEE_REE
ccflags-y += -DCONFIG_FINGERPRINT_FOCALTECH_SPI_SUPPORT
focaltech_fp-y += ff_spi.o ff_chip.o
endif

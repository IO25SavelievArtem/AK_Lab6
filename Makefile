
ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m   := hello.o
ccflags-y += -g
EXTRA_CFLAGS += -std=gnu99
else
# normal makefile
KDIR ?= /home/arti/repos/linux-stable
ARCH := arm
CROSS_COMPILE ?= arm-eabi-

default:
	$(MAKE) -C $(KDIR) M=$(PWD)
	cp hello.ko hello.ko.unstripped
	$(CROSS_COMPILE)strip -g hello.ko
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
endif

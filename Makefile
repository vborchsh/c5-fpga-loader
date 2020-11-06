################################################
#
# Makefile to Manage
# Cyclone V Programming FPGA from HPS
#
# Vladislav Borchsh
# borchsh.vn@gmail.com
# 06-11-2020 (dd-mm-yyyy)
#
################################################

# DEFINE TARGET AND SOURCE CODE
TARGET = rbf_loader.exe

# Source Code
SRCS=$(wildcard *.c functions/*.c)
OBJECTS=$(SRCS:.c=.o)

# ALTERA INFO
ALT_DEVICE_FAMILY ?= soc_cv_av
HWLIBS_ROOT = $(SOCEDS_DEST_ROOT)/ip/altera/hps/altera_hps/hwlib

# COMPILER FLAGS
CFLAGS = -g -std=c99 -Wall -Werror -I$(HWLIBS_ROOT)/include -I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY) -D$(ALT_DEVICE_FAMILY)
LDFLAGS = -g -std=c99 -Wall -Werror -pthread -lpthread

CROSS_COMPILE = arm-linux-gnueabihf-
CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)gcc
ARCH = arm

# BUILD (DEFAULT) RECIPE
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS)   $^ -o $@

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

# CLEAN RECIPE
.PHONY: clean
clean:
	rm -f $(TARGET) *.a *.o *~


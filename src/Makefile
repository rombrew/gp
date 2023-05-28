
BUILD	?= /tmp/gp
TARGET	= $(BUILD)/gp

CC	= gcc
LD	= gcc
STRIP	= strip -s
GDB	= gdb
MK	= mkdir -p
RM      = rm -rf

CFLAGS  = -std=gnu99 -pipe -Wall -O3 -flto=auto -g3
CFLAGS  += -fno-stack-protector
CFLAGS  += -I/usr/include/SDL2 -D_REENTRANT

LFLAGS	= -lm -lSDL2 -lSDL2_ttf -lSDL2_image

OBJS	= async.o \
	  dirent.o \
	  draw.o \
	  edit.o \
	  font.o \
	  gp.o \
	  lang.o \
	  lse.o \
	  lz4.o \
	  menu.o \
	  plot.o \
	  read.o \
	  scheme.o \
	  svg.o

GP_OBJS	= $(addprefix $(BUILD)/, $(OBJS))

all: $(TARGET)

$(BUILD)/%.o: %.c
	@ echo "  CC    " $<
	@ $(MK) $(dir $@)
	@ $(CC) -c $(CFLAGS) -MMD -o $@ $<

$(TARGET): $(GP_OBJS)
	@ echo "  LD    " $(notdir $@)
	@ $(LD) $(CFLAGS) -o $@ $^ $(LFLAGS)

debug: $(TARGET)
	@ echo "  GDB	" $(notdir $<)
	@ $(GDB) $<

strip: $(TARGET)
	@ echo "  STRIP " $(notdir $<)
	@ $(STRIP) $<

clean:
	@ echo "  CLEAN "
	@ $(RM) $(BUILD)

include $(wildcard $(BUILD)/*.d)



CC = arm-none-eabi-gcc
CFLAGS = -O -g -Wall -ffreestanding $(INCLUDE)
AS = arm-none-eabi-as
LD = arm-none-eabi-ld

all: run.elf

%.o: %.s
	$(AS) $< -o $@

%.elf: %.o run.ld
	$(LD) --print-memory-usage -Map=$*.map -T run.ld $< -o $@ 

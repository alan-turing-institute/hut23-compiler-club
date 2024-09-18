all: countints.hex

# Cancel the built-in ("implicit") rules
.SUFFIXES:

# Don't delete intermediate files
.SECONDARY:

AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

ARCH = -march=armv7e-m
LDSCRIPT = microbit-v2.ld


%.o: %.s
	$(AS) $(ARCH) -g $< -o $@

%.elf: %.o 
	$(LD) -T $(LDSCRIPT) $< -o $@ \
	--print-map --orphan-handling=warn --warn-section-align

%.hex: %.elf
	$(OBJCOPY) -O ihex $< $@

.PHONY: clean

clean: rm *.hex *.elf *.o

simple.s: simple.c
	arm-none-eabi-gcc -S -ffreestanding -nostdlib -march=armv7e-m+fp simple.c

simple.o: simple.s
	arm-none-eabi-as simple.s -o simple.o

a.out: simple.o minimal.ld
	arm-none-eabi-ld simple.o -nostdlib -T minimal.ld

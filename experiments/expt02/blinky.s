	.syntax unified

	@@ .arch appears to have no effect.
	@@ specify architecture or cpu as an argument to as. 	
	.arch armv7e-m 		
				

	
	.section .vectors	
	.word	__stack_top
	.word	Reset_Handler
	.word 	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0	
	.word	0
	.word 	0
	.word   0	
	.word  	0
	.word	0
	
	.zero 	4 * 112		@ No IRQ handlers


	.text

	.global Reset_Handler
	.type Reset_Handler, %function
	
Reset_Handler:			
	.equ GPIO0, 0x50000500	@ Base for GPIO0 registers
	.equ DIRSET, 0x18 	@ set bit 1 to set corresponding pin as output
	.equ DIRCLR, 0x1c	@ set bit 1 to set pin as input
	.equ OUTSET, 0x08	@ set bit 1 to set corresponding pin to high
	.equ OUTCLR, 0x0c	@ set bit 1 to set corresponding pin to low
	
	@@ Attempt to set one of the LEDs
	.equ	PIN_21, (1<<21)
	.equ	PIN_28, (1<<28)

	ldr	r0, =GPIO0 
	movs	r1, PIN_21
	str	r1, [r0, DIRSET] 	@ Set pin 21 to "output"
	movs 	r1, PIN_28
	str	r1, [r0, DIRSET]	@ Set pin 28 to "output"

	movs	r1, PIN_28
	str	r1, [r0, OUTCLR]	@ Set pin 28 to "low"
	movs	r1, PIN_21
	str	r1, [r0, OUTSET]	@ Set pin 21 to "high"
	
forever:
	b	forever

	.syntax unified

	@@ .arch appears to have no effect.
	@@ specify architecture or cpu as an argument to as. 	
	.arch armv7e-m 		
				

	
	.section .vectors	
	.word	__stack_top
	.word	Reset_Handler
	.word 	NMI_Handler	
	.word	HardFault_Handler	
	.word	MemoryManagement_Handler	
	.word	BusFault_Handler	
	.word	UsageFault_Handler	
	.word	0
	.word	0
	.word	0
	.word	0	
	.word	SVC_Handler	
	.word 	DebugMon_Handler	
	.word   0	
	.word  	PendSV_Handler	
	.word	SysTick_Handler	
	
	.zero 	4 * 112		@ No IRQ handlers
	
	
	

	.text	
	/* Reset Handler
	The reset handler checks whether this is the first time since a hard reset.
	If so, it zeros the bss section.
	If not, it adds one to a counter. 
	*/

	
	.section .rodata
magic_number:
	.word 0xdeadbeef

	.text

	.global Reset_Handler
	.type Reset_Handler, %function
Reset_Handler:		
	/* Is reset_flag == magic_number ? */
	ldr 	r0, =reset_flag		@ r0 = address of reset flag
	ldr	r2, [r0]		@ r2 = value of reset_flag
	ldr 	r1, =magic_number
	ldr 	r1, [r1]		@ r1 = value of magic_number 
	cmp	r1, r2
	it ne
	blne	initialise

	/* Add one to the reset counter and go on to count indefinitely */
	ldr	r1, =reset_counter
	ldr	r0, [r1]
	adds	r0, r0, #1
	str	r0, [r1]
	b	forever_counter

	@@ .pool -- let's see if the assembler figures this out on its own			

	.section .rodata

	.equ GPIO0, 0x50000500	@ Base for GPIO0 registers
	@@ Offsets
	.equ DIRSET, 0x18 	@ set bit 1 to set corresponding pin as output
	.equ DIRCLR, 0x1c	@ set bit 1 to set pin as input
	.equ OUTSET, 0x08	@ set bit 1 to set corresponding pin to high
	.equ OUTCLR, 0x0c	@ set bit 1 to set corresponding pin to low
	
	.text
forever_counter:
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

forever_loop:	
	@@ Loop forever	
	ldr 	r1, =reset_forever_counter
	ldr	r0, [r1]
	adds	r0, r0, #1
	str	r0, [r1]
	b	forever_loop
	
	
initialise:
	/* reset_flag != magic_number. This is the first time through. */
	/* r0 is the address of the reset_flag, r1 is the value of magic number */

	@@ Zero bss (which contains the reset_flag and all the counters)
	movs	r2, 0
	ldr	r3, =__bss_start
	ldr	r4, =__bss_end	@ __bss_end is just after the last byte of bss
	subs	r4, r4, r3 	@ r4 <- sizeof(bss)

zero_more_bss:
	cbz	r4, done_zeroing
	subs	r4, 4
	str	r2, [r3, r4] 
	b	zero_more_bss
	
done_zeroing:
	str	r1, [r0]	@ Set up the reset flag so next time we know
	bx	lr		@ Return to the next part of Reset_Handler
	
	
	
	
	



	.bss

reset_flag:			@ set to magic_number if we've been here before
	.space 4
reset_counter:
	.space 4
reset_forever_counter:
	.space 4



	.text
	
	/* Dummy handlers -- taken from nrfx */

	/* Dummy Exception Handlers (infinite loops which can be modified) */

    .weak   NMI_Handler
    .type   NMI_Handler, %function
NMI_Handler:
    b       .
    .size   NMI_Handler, . - NMI_Handler


    .weak   HardFault_Handler
    .type   HardFault_Handler, %function
HardFault_Handler:
    b       .
    .size   HardFault_Handler, . - HardFault_Handler


    .weak   MemoryManagement_Handler
    .type   MemoryManagement_Handler, %function
MemoryManagement_Handler:
    b       .
    .size   MemoryManagement_Handler, . - MemoryManagement_Handler


    .weak   BusFault_Handler
    .type   BusFault_Handler, %function
BusFault_Handler:
    b       .
    .size   BusFault_Handler, . - BusFault_Handler


    .weak   UsageFault_Handler
    .type   UsageFault_Handler, %function
UsageFault_Handler:
    b       .
    .size   UsageFault_Handler, . - UsageFault_Handler


    .weak   SVC_Handler
    .type   SVC_Handler, %function
SVC_Handler:
    b       .
    .size   SVC_Handler, . - SVC_Handler


    .weak   DebugMon_Handler
    .type   DebugMon_Handler, %function
DebugMon_Handler:
    b       .
    .size   DebugMon_Handler, . - DebugMon_Handler


    .weak   PendSV_Handler
    .type   PendSV_Handler, %function
PendSV_Handler:
    b       .
    .size   PendSV_Handler, . - PendSV_Handler


    .weak   SysTick_Handler
    .type   SysTick_Handler, %function
SysTick_Handler:
    b       .
    .size   SysTick_Handler, . - SysTick_Handler


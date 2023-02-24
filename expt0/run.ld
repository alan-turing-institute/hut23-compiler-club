/* *Very* minimal linker script for micro:bit version 1 */
/* Use the -T argument to ld to specify this script */

/* WHAT'S MISSING */
/* - .data, .bss */
/* - peripherals, either ARM or Nordic */

OUTPUT_FORMAT ("elf32-littlearm")

/* This is the memory layout of the nRF51822_xxaa, used in the micro:bit version */
/* 1 */

/* The names FLASH and RAM are defined by the MEMORY command. They are not used */
/* outside this script and are in a different namespace from symbols, filenames, */
/* or section names. ld manual, section 3.7 */

/* 0x20000000 is 2^29, or 2^9 x 2^20 or 0.5 GiB */
MEMORY {
       FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 256K
       RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 16K
}

/* There's no obligation to set the "entry point," since the M0 starts execution
at the address in 0x04. However, Spivey notes that setting it helps GDB find the
stack bottom. (Although I am not sure how?) */

/* __reset is a symbol defined elsewhere. Somehow we need to make sure that it */
/* ends up at 0x00000004.  */
ENTRY(__reset)

/* The KEEP stops this section being "garbage collected;" however section */
/* garbage collection is not enabled by default. You'd need to use the */
/* --gc-sections argument to ld to enable it. */ 
SECTIONS {
  .text : {
        KEEP(*(.vectors)) 
        *(.text) 
        *(.rodata)
  } > FLASH

 /* This linker script does not support static data! */
 /* The .data section needs an AT (it's initialised data but lives in RAM) */
 /*
 .data : {
        *(.data)
  } > RAM --
*/

/* If we write assembly, we'll need to write our own startup code to zero
  these out. */
/* Also need a COMMON here */
/*
  .bss : {
       *(.bss)
  } > RAM
}
*/

  
/* PROVIDE(symbol = expression) defines symbol only if it is referenced by some */
/* other place but never defined.  */

/*

SECTIONS {
    .text : {
       KEEP(*(.vectors))
        *(.text*)
        *(.rodata*)
        . = ALIGN(4);
        __etext = .;

        PROVIDE(nmi_handler = default_handler);
        PROVIDE(hardfault_handler = default_handler);
        PROVIDE(svc_handler = default_handler);
        PROVIDE(pendsv_handler = default_handler);
        PROVIDE(systick_handler = default_handler);
        PROVIDE(uart_handler = default_handler);
        PROVIDE(timer0_handler = default_handler);
        PROVIDE(timer1_handler = default_handler);
        PROVIDE(timer2_handler = default_handler);
        PROVIDE(power_clock_handler = default_handler);
        PROVIDE(radio_handler = default_handler);
        PROVIDE(i2c_handler = default_handler);
        PROVIDE(spi_handler = default_handler);
        PROVIDE(gpiote_handler = default_handler);
        PROVIDE(adc_handler = default_handler);
        PROVIDE(rtc0_handler = default_handler);
        PROVIDE(temp_handler = default_handler);
        PROVIDE(rng_handler = default_handler);
        PROVIDE(ecb_handler = default_handler);
        PROVIDE(ccm_aar_handler = default_handler);
        PROVIDE(wdt_handler = default_handler);
        PROVIDE(rtc1_handler = default_handler);
        PROVIDE(qdec_handler = default_handler);
        PROVIDE(lpcomp_handler = default_handler);
        PROVIDE(swi0_handler = default_handler);
        PROVIDE(swi1_handler = default_handler);
        PROVIDE(swi2_handler = default_handler);
        PROVIDE(swi3_handler = default_handler);
        PROVIDE(swi4_handler = default_handler);
        PROVIDE(swi5_handler = default_handler);
    } > FLASH

    .data : AT (__etext) {
        __data_start = .;
        *(.data*)
        . = ALIGN(4);
        __data_end = .;
    } > RAM

    .bss : {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        __bss_end = .;
        __end = .;
    } > RAM

    /* Set stack top to end of RAM, and move stack limit down by
       size of stack */

    /* Check if data + stack exceeds RAM limit */
/*
    __stack = ORIGIN(RAM) + LENGTH(RAM);
    __stack_limit = __stack - 2048; 

    ASSERT(__stack_limit >= __end, "region RAM overlaps with stack")
*/

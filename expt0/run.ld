/* Minimal linker script for micro:bit version 1 */

/* nrf.ld (from Nordic) also says:

SEARCH_DIR(.)

pp. 57
SEARCH_DIR(path) The SEARCH_DIR command adds path to the list of paths where ld
  looks for archive libraries. Using SEARCH_DIR(path) is exactly like using ‘-L
  path’ on the command line (see Section 2.1 [Command-line Options], page 3). If
  both are used, then the linker will search both paths. Paths specified using
  the command-line option are searched first.


GROUP(-lgcc -lc -lnosys)

pp. 56
GROUP(file file ...) The GROUP command is like INPUT, except that the named
  files should all be archives, and they are searched repeatedly until no new
  undefined references are created. See the description of ‘-(’ in Section 2.1
  [Command-line Options], page 3.

*/

/* The names FLASH and RAM are defined by the MEMORY command. They are not used */
/* outside this script and are in a different namespace from symbols, filenames, */
/* or section names. ld manual, section 3.7 */

/* 0x20000000 is 2^29, or 2^9 x 2^20 or 0.5 GiB */
MEMORY {
       FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 256K
       RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 16K
}

SECTIONS {
  .text : {
        *(.text) 
        *(.rodata)
  } > FLASH
  .data : {
        *(.data)
  } > RAM
  .bss : {
       *(.bss)
  } > RAM
}


/* Spivey's script also does:

OUTPUT_FORMAT ("elf32-littlearm")
-- see pp. 57

ENTRY(__reset)
-- see pp. 55

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
    __stack = ORIGIN(RAM) + LENGTH(RAM);
    __stack_limit = __stack - 2048;

    /* Check if data + stack exceeds RAM limit */
    ASSERT(__stack_limit >= __end, "region RAM overlaps with stack")
}

*/

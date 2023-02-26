MEMORY {
       FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 256K
       RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 16K
}

OUTPUT_FORMAT ("elf32-littlearm")

ENTRY(__reset)

SECTIONS {
  .text : {
        KEEP(*(.vectors)) 
        *(.text) 
        *(.rodata)
  } > FLASH

  __stack = ORIGIN(RAM) + LENGTH(RAM);

} 


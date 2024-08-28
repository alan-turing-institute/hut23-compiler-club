MEMORY {
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 512K
  RAM (rwx) :  ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS {
  /* At this point, the "current location" is 0x 0000 0000 */
  .text : { *(.text) } >FLASH
}


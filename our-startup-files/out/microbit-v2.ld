/* 
BBC micro:bit v2 (woefully incomplete) linker script
Written by the Hut23 Compiler Club
*/
MEMORY {
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 512K  
  RAM (wx)   : ORIGIN = 0x20000000, LENGTH = 128K  
}
  /* This is all wrong */
  SECTIONS {
  .text : { *(.text) } >FLASH
}

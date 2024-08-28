  @@@ run.s
  @@@ Assemble with -mcpu=cortex-m0 -mthumb

  
  .syntax unified
  .thumb
  .cpu cortex-m0
  .arch armv6-m                 /* Overridden by -mcpu, I suspect */

  @@@ The following is adapted from Nordic's gcc_startup_nrf51.S

  /* The exception vector table consists of:
  - 16 words, defined for the M0 arhictecture
  - 32 words, defining external interrupts

See: Cortex M0 Generic Userguide, 2.3.2, as well as table 2-1
  */ 

  .section .vectors
  .global __vector_table

__vector_table:                 @   No. IRQ Pri
  /* Exceptions */              @   --- --- ---
    .word   __stack             @     -   -   -       
    .word   __reset             @     1   -  -3 
    .word   NMI_Handler         @     2 -14  -2   
    .word   HardFault_Handler   @     3 -13  -1
    .word   0 /* Reserved */
    .word   0 /* Reserved */                                 
    .word   0 /* Reserved */
    .word   0 /* Reserved */
    .word   0 /* Reserved */
    .word   0 /* Reserved */
    .word   0 /* Reserved */
    .word   SVC_Handler         @    11  -5 
    .word   0 /* Reserved */
    .word   0 /* Reserved */
    .word   PendSV_Handler      @    14  -2
    .word   SysTick_Handler     @    15  -1

  /* External Interrupts */     
    .word   POWER_CLOCK_IRQHandler  
    .word   RADIO_IRQHandler
    .word   UART0_IRQHandler
    .word   SPI0_TWI0_IRQHandler
    .word   SPI1_TWI1_IRQHandler
    .word   0                           /*Reserved */
    .word   GPIOTE_IRQHandler
    .word   ADC_IRQHandler
    .word   TIMER0_IRQHandler
    .word   TIMER1_IRQHandler
    .word   TIMER2_IRQHandler
    .word   RTC0_IRQHandler
    .word   TEMP_IRQHandler
    .word   RNG_IRQHandler
    .word   ECB_IRQHandler
    .word   CCM_AAR_IRQHandler
    .word   WDT_IRQHandler
    .word   RTC1_IRQHandler
    .word   QDEC_IRQHandler
    .word   LPCOMP_IRQHandler
    .word   SWI0_IRQHandler
    .word   SWI1_IRQHandler
    .word   SWI2_IRQHandler
    .word   SWI3_IRQHandler
    .word   SWI4_IRQHandler
    .word   SWI5_IRQHandler
    .word   0                           /*Reserved */
    .word   0                           /*Reserved */
    .word   0                           /*Reserved */
    .word   0                           /*Reserved */
    .word   0                           /*Reserved */
    .word   0                           /*Reserved */

  /*  
  Gnu as, 7.89: This directive sets the size associated with a
  symbol name. The size in bytes is computed from expression which can
  make use of label arithmetic. This directive is typically used to
  set the size of function symbols.
  */
  /* I wonder if this is help the C compiler address the vector table as an array?
  
  .size __isr_vector, . - __isr_vector

  /*  
  
/* Reset Handler */

  .text

  .thumb
  .thumb_func
  .align 1
  .global __reset
  .type __reset, %function
__reset:

  nop
  wfe

  .size   __reset, . - __reset

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


    .weak   SVC_Handler
    .type   SVC_Handler, %function
SVC_Handler:
    b       .
    .size   SVC_Handler, . - SVC_Handler


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


/* IRQ Handlers */

    .globl  Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    b       .
    .size   Default_Handler, . - Default_Handler

    .macro  IRQ handler
    .weak   \handler
    .set    \handler, Default_Handler
    .endm

    IRQ  POWER_CLOCK_IRQHandler
    IRQ  RADIO_IRQHandler
    IRQ  UART0_IRQHandler
    IRQ  SPI0_TWI0_IRQHandler
    IRQ  SPI1_TWI1_IRQHandler
    IRQ  GPIOTE_IRQHandler
    IRQ  ADC_IRQHandler
    IRQ  TIMER0_IRQHandler
    IRQ  TIMER1_IRQHandler
    IRQ  TIMER2_IRQHandler
    IRQ  RTC0_IRQHandler
    IRQ  TEMP_IRQHandler
    IRQ  RNG_IRQHandler
    IRQ  ECB_IRQHandler
    IRQ  CCM_AAR_IRQHandler
    IRQ  WDT_IRQHandler
    IRQ  RTC1_IRQHandler
    IRQ  QDEC_IRQHandler
    IRQ  LPCOMP_IRQHandler
    IRQ  SWI0_IRQHandler
    IRQ  SWI1_IRQHandler
    IRQ  SWI2_IRQHandler
    IRQ  SWI3_IRQHandler
    IRQ  SWI4_IRQHandler
    IRQ  SWI5_IRQHandler

  .end


   

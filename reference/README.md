# Technical reference material for the micro:bit v2 hardware

## Documentation

- `cpu`: Arm documentation for the Cortex M4 (note that their
  developer website does not appear to load in Firefox)
  - [Datasheet](./cpu/Arm-Cortex-M4-Processor-Datasheet.pdf)
    (and [web version](https://developer.arm.com/documentation/102832/0100/?lang=en))
  - [Generic User Guide](./cpu/cortex-m4-gug.pdf) (and [web version](https://developer.arm.com/documentation/dui0553/b/?lang=en))
  - [Arm instruction set quick reference](./cpu/QRC0001_UAL.pdf)
  - [Arm assembler user guide](./cpu/armasm_user_guide_DUI0801_l_en.pdf)
    (and [html
    version](https://developer.arm.com/documentation/dui0801/l/?lang=en)).
    We're using the GNU assembler but chapter 7 onwards explains the
    instruction set in detail.
  - [Technical Reference Manual](./cpu/cortex-m4-trm.pdf)
    (and [web version](https://developer.arm.com/documentation/100166/0001/?lang=en))
  - [Arm v7-M Architecture Reference
    Manual](./cpu/armv7m-arch-ref.pdf) (and [web version](https://developer.arm.com/documentation/ddi0403/ee/?lang=en))
  - [Procedure Call
    Standard](./cpu/aapcs32.pdf) (and [html version](https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst))

- `SoC`: Documentation for the nRF52833 system-on-a-chip
  - [nRF52833 Product Specification](./SoC/nRF52833_PS_v1.7/pdf) (and
    [web version](https://docs.nordicsemi.com/bundle/ps_nrf52833/page/keyfeatures_html5.html))

- `micro:bit`
  - [James G's notes](./microbit/microbit-v2-notes.org)
  
## Published code examples and SDKs

- [Nordic Semiconductor
  nrfx](https://docs.nordicsemi.com/bundle/ncs-latest/page/nrfx/index.html)
  (and [GitHub repository](https://github.com/NordicSemiconductor/nrfx))
  is a set of drivers for all the peripherals in Nordic's SoCs,
  including the nRF52833.
- The [full Nordic
  SDK](https://docs.nordicsemi.com/bundle/ncs-latest/page/nrf/index.html), including the Zephyr real-time operating
  system. 
- [Arm
  CMSIS](https://arm-software.github.io/CMSIS_6/latest/General/index.html)
  Common Microcontroller Interface Standard (and [GitHub repo](https://github.com/ARM-software/CMSIS_6)).

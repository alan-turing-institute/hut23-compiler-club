# hut23-compiler-club
An informal club to learn about computer fundamentals

Some getting started and other instructions are on [the wiki](https://github.com/alan-turing-institute/hut23-compiler-club/wiki)

## Contents of the reference directory

- `cpu`: Arm documentation for the Cortex M4 (note that their
  developer website does not appear to load in Firefox)
  - [Datasheet](./reference/cpu/Arm-Cortex-M4-Processor-Datasheet.pdf)
    (and [web version](https://developer.arm.com/documentation/102832/0100/?lang=en))
  - [Generic User Guide](./reference/cpu/cortex-m4-gug.pdf)
    (and [web version](https://developer.arm.com/documentation/dui0553/b/?lang=en))
  - [Technical Reference Manual](./reference/cpu/cortex-m4-trm.pdf)
    (and [web version](https://developer.arm.com/documentation/100166/0001/?lang=en))
  - [Arm v7-M Architecture Reference
    Manual](./reference/cpu/armv7m-arch-ref.pdf) (and [web version](https://developer.arm.com/documentation/ddi0403/ee/?lang=en))	

- `SoC`: Documentation for the nRF52833 system-on-a-chip
  - [nRF52833 Product Specification](./SoC/nRF52833_PS_v1.7/pdf) (and
    [web version](https://docs.nordicsemi.com/bundle/ps_nrf52833/page/keyfeatures_html5.html))

## Published code examples and SDKs

- [Nordic Semiconductor
  nrfx](https://docs.nordicsemi.com/bundle/ncs-latest/page/nrfx/index.html)
  (and [GitHub repository](https://github.com/NordicSemiconductor/nrfx))
  is a set of drivers for all the peripherals in Nordic's SoCs,
  including the nRF52833.
- The [full Nordic SDK](, including the Zephyr real-time operating
  system.
- [Arm
  CMSIS](https://arm-software.github.io/CMSIS_6/latest/General/index.html)
  (Common Microcontroller Interface Standard) (and [GitHub repo](https://github.com/ARM-software/CMSIS_6)).

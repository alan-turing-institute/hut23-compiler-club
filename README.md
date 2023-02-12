# hut23-compiler-club
Informal club to learn about computer fundamentals

### Setup notes for micro:bit

These brief notes are by JG.

**QEMU** can be installed with homebrew:
```sh
brew install qemu
```
I think the command we will need is `qemu-system-arm`, with some flags.

The **GNU compiler collection** for ARM is needed for cross-compilation to the ARM Cortex. (The built-in gcc is actually clang.) 
```sh
brew install gcc-arm-embedded
```
Note that it installs to `/Applications/ArmGNUToolchain/`. Then, for example, the compiler is `arm-none-eabi-gcc`. (Which ended up in my path, somehow.) 

Mike Spivey's **Digital Systems course** labs are available from a mercurial repository:
```sh
brew install hg
hg clone https://spivey.oriel.ox.ac.uk/hg/digisys
```

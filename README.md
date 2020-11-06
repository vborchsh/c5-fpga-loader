# Cyclone V FPGA Configuration from Linux

> Based on:
> https://github.com/nhasbun/de10nano_fpga_linux_config

Software to configure the FPGA portion of the Cyclone V SoC. It works under Linux.

References:

* Cyclone V HPS Memory Map
* Cyclone V Hard Processor System Technical Reference Manual (Cyclone V Handbook Volume 3) section **FPGA MANAGER**

This is fully implemented in C using direct register access to take control of the FPGA Manager device which is used by the HPS to configure the FPGA. No external libraries are used other than Linux system calls and SoCAL libraries included on Quartus installations. Partial reconfiguration is still not studied but could be implemented in the future since it gives an important boost to create many applications.

 Programming FPGA from HPS could be accomplished by using direct register access to FPGA Manager. And we can accomplish a Linux method agnostic to the current distribution or internal system configuration.

## Compilation

Altera Embedded Command Shell (16.1 or newer) should be used to compile the project. Just run "make" and there you go.

## Loading rbf File

RBF file should be created from Quartus Project with __compression__ enabled and MSEL [4:0] pins with 01010 settings. Code is easily modifiable to match other MSEL configurations (keep an eye on *cdgwdth* and *cdratio* registers) but Altera recommends using always FPP x 32 configuration scheme anyways.

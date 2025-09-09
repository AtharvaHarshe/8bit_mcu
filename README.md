8-Bit CPU Core Verilog Project
Overview

This project implements a simple 8-bit microcontroller (CPU core) in Verilog. The CPU supports a small instruction set, performs basic arithmetic operations, and interfaces with memory and output ports. The design demonstrates core concepts of CPU architecture including fetch-decode-execute cycles, program memory, data memory, and register operations.

The project includes a top-level module and a testbench for simulation.

Features

8-bit data width and instruction width

Registers:

Program Counter (PC)

Accumulator (ACC)

Halt flag

Memory:

256 bytes program memory

256 bytes data memory

Instruction Set:

LOAD – Load data from memory to ACC

ADD – Add memory data to ACC

STORE – Store ACC value to output port

HALT – Stop program execution

Top-level module for easy integration

Testbench for simulation and verification

Project Structure

8bit_CPU_Core/

├── src/

│   ├── cpu_core.v     # Main CPU core implementation

│   └── top.v          # Top-level wrapper module

├── tb/

│   └── tb_top.v       # Testbench for simulation

└── README.md


Getting Started
Prerequisites

Vivado, ModelSim, or any Verilog simulator

Basic understanding of digital design, Verilog HDL, and CPU architecture

Simulation

Open the project in your preferred Verilog simulator.

Compile all source files from src/ and testbench files from tb/.

Run the testbench tb_top.v to simulate CPU execution.

Observe outputs for ACC and OUT_PORT signals. Use waveform viewers to monitor PC, ACC, and OUT_PORT.

Clock

The CPU clock is generated in the testbench as a 10 ns period (#5 CLK = ~CLK;), which corresponds to 100 MHz.

Instructions

The program memory is initialized in the initial block of cpu_core.v.

Example program executed:

Load data from memory address 2 into ACC

Add data from memory address 3 to ACC

Store ACC to OUT_PORT

Halt execution

Data memory is pre-initialized with:

data_mem[2] = 5

data_mem[3] = 7

Usage

Modify prog_mem in cpu_core.v to execute custom programs.

Update data_mem for different input data.

Monitor ACC_OUT and OUT_PORT to verify execution results.

Use the testbench to validate instruction execution and CPU behavior before FPGA synthesis or hardware deployment.

Future Work

Expand the instruction set (e.g., subtraction, logical operations, jumps)

Add multiple general-purpose registers

Include memory-mapped I/O for external peripherals

Implement interrupt handling and timers

Author

Atharva Sanjeev Harshe

Email: athhar2551@gmail.com


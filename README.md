

# Simple Single-Cycle MIPS Processor in Verilog

## Overview

This project is a learning exercise to design and simulate a simple single-cycle MIPS processor using Verilog. It supports nine different instructions: Add, Sub, And, Or, Lw, Sw, BEQ, BNE, and Jump.

## Features

- **Instruction Set**:
  - Add: `000000`
  - Sub: `000001`
  - And: `000010`
  - Or: `000011`
  - Lw: `000100`
  - Sw: `000101`
  - BEQ: `000110`
  - BNE: `000111`
  - Jump: `001000`
  - SLT (currently not implemented): `001001`
- **Datapath**:
  - 8-bit operations
  - Instruction memory: 256 words by 32 bits
  - Data memory: 256 words by 8 bits

## Project Details

- **Verilog Version**: Verilog 2005
- **Simulation Platform**: Altera Cyclone IV DE2 board
- **Development Tool**: Quartus II 13sp.01

## Prerequisites

- Quartus II 13sp.01 (or compatible version)

## Getting Started

1. **Add Files to Quartus II**:
   - Create a new project in Quartus II.
   - Add all Verilog source files to the project.
2. **Compile the Project**:
   - Set the top-level entity.
   - Compile the project.
3. **Run the Simulation**:
   - Open the top-level waveform file.
   - Run the simulation to see the results of the simple commands.

## Testing

The top-level waveform runs a set of simple commands to test:
- Loading and storing (Lw, Sw)
- Branching and jumping (BEQ, BNE, Jump)
- R-type operations (Add, Sub, And, Or)

## Known Issues

There are no known bugs in this implementation.

## License

This project is open-source and available for educational and personal use.

## Contact

For more information or contributions, please contact me at Aaditya.Shah@hotmail.com

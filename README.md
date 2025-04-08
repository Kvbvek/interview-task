## Project Goal

The main objective of this task is to implement a hardware-friendly approximation of a trigonometric function using SystemVerilog, based on a quadratic interpolation model. The function to approximate is:
`f(x) = sin(2x - π/4),  for x in [0, 2)`

The design must be suitable for FPGA or ASIC implementation, and should meet a strict accuracy requirement:  
Δ < 5.25e-6 compared to IEEE double-precision reference.

Key steps include:
- Modeling and coefficient generation in MATLAB/Octave
- C++ fixed-point model for functional validation
- RTL implementation in SystemVerilog
- Simulation and verification using Verilator + GTKWave
- Final optimization of coefficient sizes and hardware area (in progress)

**Status**: RTL implementation in progress.

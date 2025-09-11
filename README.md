# DIGI-WARE — Verilog Digital Design Library

## 📖 Project Overview
This repository is a collection of **fundamental digital design building blocks** written in **Verilog HDL**.  
It is designed as a **learning resource** and a **base library** for digital systems engineers, students, and hobbyists.  

The modules cover the **full spectrum of digital design**:
- **Combinational logic** (decoders, comparators, multiplexers)  
- **Arithmetic circuits** (adders)  
- **Sequential circuits** (latches, flip-flops)  
- **Registers and counters** (binary, BCD, shift registers, rotators)  
- **System-level design** (24-hour alarm clock)  

The goal is to make a **simulation-first library** where each block is simple, self-contained, and easy to test.  
It serves both as:
1. A **reference collection** for standard digital circuits, and  
2. A **teaching toolkit** with examples of behavioral, dataflow, and gate-level modeling in Verilog.  

---

## 📂 Contents and Descriptions

### 🔹 Combinational Modules
- **3-bit Magnitude Comparator**  
  - Compares two 3-bit numbers.  
  - Outputs three flags: **Equal, Greater, Lower**.  
  - Useful for building sorting circuits or conditional control logic.  

- **3-to-8 Decoder**  
  - Converts a 3-bit binary input into one of 8 active outputs.  
  - Standard building block for memory addressing and control logic.  

- **4:1 Multiplexer (MUX)**  
  - Selects one of 4 input signals based on a 2-bit select line.  
  - Implemented at the **gate level** using `NOT`, `AND`, `OR`.  
  - Demonstrates how higher-level logic can be built from primitives.  

---

### 🔹 Arithmetic Modules
- **1-bit Full Adder**  
  - Computes sum and carry of two input bits plus carry-in.  
  - Core building block for larger adders and ALUs.  

- **4-bit Ripple-Carry Adder**  
  - Composed of four 1-bit full adders.  
  - Demonstrates **hierarchical design** in Verilog.  
  - Shows propagation delay effects in sequential carries.  

---

### 🔹 Sequential Primitives
- **SR Latch**  
  - Level-sensitive memory element with Set/Reset inputs.  
  - Illustrates the concept of **bistability** in digital systems.  

- **D Flip-Flop (DFF)**  
  - Edge-triggered storage element.  
  - Captures input `D` on the rising edge of clock and holds it until next edge.  
  - Fundamental unit in registers and pipelines.  

- **JK Flip-Flop**  
  - More versatile flip-flop that can set, reset, hold, or toggle based on inputs `J` and `K`.  
  - Implemented as a **case-based truth table**.  

- **T Flip-Flop**  
  - Toggles output on every clock when enabled.  
  - Useful for building counters and frequency dividers.  

---

### 🔹 Registers and Counters
- **4-bit Binary Counter**  
  - Increments synchronously on each clock cycle.  
  - Active-high reset for initialization.  
  - Often used in timing and event counting.  

- **4-digit BCD Counter**  
  - Cascaded chain of decimal counters to represent 0–9999.  
  - Rolls over digit-by-digit.  
  - Demonstrates **digit enable** and **carry propagation** in decimal counters.  

- **4-bit Shift Register**  
  - Supports asynchronous clear.  
  - Parallel load and serial-in/serial-out capability.  
  - Essential in serial communication, data buffering, and scramblers.  

- **100-bit Rotator**  
  - Shifts bits left or right circularly with a 2-bit control signal.  
  - Can load new data and rotate large words.  
  - Demonstrates parameterizable design for large buses.  

---

### 🔹 System-Level Design: Alarm Clock
- **aclock.v**  
  - Fully functional **24-hour digital clock with alarm feature**.  
  - Assumes a **10 Hz input clock** and divides it internally to 1-second ticks.  
  - Features:
    - Loadable time and alarm setting  
    - BCD outputs for HH:MM:SS  
    - Alarm latch and stop/acknowledge control  
  - Integrates concepts of **counters, registers, and control logic** into one cohesive design.  

- **CACT Testbench**  
  - Simulates full usage of the alarm clock:  
    - Resetting  
    - Loading time and alarm  
    - Allowing clock to run, checking rollover  
    - Triggering and acknowledging alarm  
  - Provides a complete **end-to-end system test**.  

---

## ▶️ How to Run

### 🔸 Simulation
1. Install a Verilog simulator:  
   - [Icarus Verilog](http://iverilog.icarus.com/)  
   - ModelSim / Questa  
   - Xcelium  

2. Compile and run testbenches:  
   ```bash
   iverilog -g2012 -o sim tb/CACT.v src/aclock.v
   vvp sim

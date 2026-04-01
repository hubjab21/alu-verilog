# 8-bit ALU in Verilog

This project implements a simple 8-bit Arithmetic Logic Unit (ALU) in Verilog together with a testbench and waveform visualization using GTKWave.

---

## Description

The ALU is a basic building block in digital systems.
It performs arithmetic and logical operations on two 8-bit inputs.

Inputs:

- `A` – 8-bit value
- `B` – 8-bit value
- `OpCode` – selects the operation

Outputs:

- `Result` – operation result
- flags: `Carry`, `Zero`, `Overflow`, `Parity`

---

## Operations

| OpCode | Operation         |
| ------ | ----------------- |
| 0000   | A + B             |
| 0001   | A - B             |
| 0010   | A & B             |
| 0011   | A | B             |
| 0100   | A ^ B             |
| 0101   | ~A                |
| 0110   | Shift left        |
| 0111   | Shift right       |
| 1000   | Rotate left       |
| 1001   | Rotate right      |
| 1010   | A == B            |
| 1011   | A < B             |
| 1100   | A * B             |
| 1101   | A / B             |
| 1110   | A % B             |
| 1111   | Conditional shift |

---

## Flags

- `Carry` – used for addition overflow
- `Zero` – set when result is 0
- `Overflow` – basic signed overflow detection
- `Parity` – even number of bits set to 1

---

## Setup

Install required tools:

```bash
sudo apt install iverilog gtkwave
```

---

## Run

Compile:

```bash
iverilog -o ALU_sim -s ALU_testbench ALU.v ALU_testbench.v
```

Run:

```bash
vvp ALU_sim
```

Open waveform:

```bash
gtkwave ALU_waveform.vcd
```

---

## Project Structure

```
├── ALU.v
├── ALU_testbench.v 
├── ALU_sim 
├── ALU_waveform.vcd 
├── images 
│ └── waveform.png 
└── README.md
```

---

## Result

![Waveform](images/waveform.png)

The waveform shows inputs, selected operation, result, and flags.

---

## Notes

- division by zero gives undefined (`X`) values
- carry is handled only for addition
- implementation is simple and not optimized

---

## Possible improvements

- better overflow handling
- division-by-zero protection
- extend to 16/32-bit
- add automated tests

---

## Author

Hubert Jabłoński


# FPGA Stream Password Checker & Data Sorter 🔐

## 1. Project Overview
This project implements a real-time data stream processor on FPGA using **SystemVerilog**. It acts as a security & classification unit that performs two parallel tasks on an incoming stream of characters:
1.  **Pattern Recognition (Security):** Detects a specific password sequence ("andre") using a Finite State Machine (FSM).
2.  **Data Sorting:** Classifies incoming characters as Vowels or Consonants and directs them to separate memory blocks (RAM).

This project demonstrates the FPGA's capability to handle parallel logic execution, separating control flow (security check) from data flow (storage).

## 2. File Description & Module Breakdown

### 📂 Source Code (`/src`)
* **`top.sv`**: The top-level wrapper that synchronizes the input stream with the processing logic.
* **`pass_check_fsm.sv`**: A Mealy Finite State Machine that monitors the stream. It asserts the `check` signal HIGH immediately upon detecting the sequence `a-n-d-r-e`.
* **`vowel_checker_struct.sv`**: Combinational logic that classifies the ASCII input.
* **`demux.sv`**: Routes the data to the correct RAM based on the classification (Vowel vs Consonant).
* **`ram.sv`**: Dual distributed RAM units for storing the sorted data.
* **`counter_6b.sv` & `reg_6b.sv`**: Handles internal addressing and data pipelining.

### 📂 Simulation (`/tb`)
* **`testbench.sv`**: Generates a character stream to verify both the sorting logic (a,b,c...) and the password unlocking mechanism.

## 3. Functional Logic
The system processes data on every clock cycle:
* **Input:** 8-bit ASCII characters.
* **Processing:**
    * If the character matches the next expected letter of the password, the FSM state advances.
    * Simultaneously, the character is analyzed. If it is a vowel, it is stored in `RAM_Vowels`; otherwise, it goes to `RAM_Consonants`.
* **Output:** A `check` signal is asserted HIGH only when the full password sequence is detected.

## 4. Simulation Results
The design was verified in Vivado Simulator.
The waveform below shows the sorting test followed by the password sequence. Notice that the **`check_t` signal goes HIGH** exactly when the final character ('e') is received.

![Simulation Waveform](docs/simulation_waveform.png)

## 5. Tools Used
* **Language:** SystemVerilog
* **IDE:** Xilinx Vivado 2024.2

---
*Created by Zaharia Andrei-Cristian - 2025*
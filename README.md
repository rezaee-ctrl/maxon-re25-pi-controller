# DC Motor Speed Control using PI Controller (Maxon RE 25)

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023a%2B-orange.svg)](https://www.mathworks.com/)
[![Simulink](https://img.shields.io/badge/Simulink-Control%20System-blue.svg)](https://www.mathworks.com/products/simulink.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A comprehensive MATLAB & Simulink repository dedicated to the modeling, PI controller design, and velocity regulation simulation of a **Maxon RE 25 DC Motor**. This project demonstrates linear control system principles, step response optimization, and disturbance rejection analysis under sudden load variations.

---

## 🚀 Project Overview & Features
* **Physical Modeling:** Based on the electrical and mechanical parameters of the Maxon RE 25 DC motor.
* **PI Controller Design:** Custom-tuned Proportional-Integral controller to ensure precise speed tracking, fast settling time, and system stability.
* **Performance Evaluation:** Analyzes key transient and steady-state performance metrics, including reference tracking and load disturbance resilience.
* **Structured Repository:** Clean layout containing initialization scripts, Simulink block diagrams, documentation, and graphical results.

---

## 📂 Repository Structure

- `maxon-re25-pi-controller/`
  - `assets/` — Simulation output plots, scope captures, and system response charts
  - `docs/` — Technical notes, design calculations, and project reports
  - `scripts/` — MATLAB initialization and parameter tuning scripts
  - `simulink/` — Simulink model files (.slx)
  - `LICENSE` — MIT Open Source License
  - `README.md` — Project documentation

---

## 📊 Simulation Results & Performance Indices

The control system was evaluated at a reference speed of **1014 RPM**, incorporating a sudden load disturbance test during runtime. The quantitative performance metrics extracted from the Simulink Scope measurements are as follows:

* **Reference Speed:** 1014 RPM
* **Maximum Overshoot (Mp):** 14.29% (Peak velocity ≈ 1158.9 RPM)
* **Speed Drop (Load Disturbance):** 1.15% (Transient drop ≈ 11.6 RPM)

### 1. Simulink Block Diagram
![Simulink Block Diagram](assets/simulink_block_diagram.png)

### 2. Speed Response (Scope Output)
![Speed Response Scope](assets/speed_response_scope.png)

---

## ⚙️ How to Run the Simulation

1. **Prerequisites:** Ensure **MATLAB & Simulink** (Recommended: R2023a or newer) with the Control System Toolbox is installed.
2. **Clone the Repository:**
   git clone https://github.com/rezaee-ctrl/maxon-re25-pi-controller.git
3. **Open MATLAB:** Navigate to the root directory of the cloned repository.
4. **Load Parameters:** Run the initialization script inside the `scripts/` folder to load motor constants and controller gains into the MATLAB workspace.
5. **Run the Model:** Open the Simulink model inside the `simulink/` folder and click **Run** to simulate and observe the dynamic velocity response on the Scope.

---

## 💡 Author
* **Abbas Rezaee** — [GitHub Profile](https://github.com/rezaee-ctrl)

---

## 📝 License
This project is open-source and distributed under the terms of the [MIT License](LICENSE).


# Fuzzy-Genetic Control System for Semi-Submersible Platform Dynamic Positioning

This project focuses on the control of a semi-submersible drilling platform using a hybrid approach that combines Genetic Algorithms with Fuzzy Logic. The primary objective is to develop and validate adaptive control strategies for the semi-submersible platform under both simulation conditions and physical experimental implementation.
---
## 🛠️ Platform Modeling

The platform model is developed based on the real-world **Stena Don semi-submersible rig**, with the following key components:

- Analysis of the motion structure and dynamic behavior of the semi-submersible system.  
- Definition of different operational modes, including station-keeping and trajectory-following.  
- Identification of key environmental and mechanical factors affecting system performance.  
- Full system simulation in the **MATLAB/Simulink** environment to evaluate control effectiveness and dynamic stability.
---

## ⚙️ Control Methods

### 1. Adaptive Fuzzy Controller (AFC)
- Uses position error and its derivative as inputs.
- Applies fuzzy inference rules to determine control action.
- Enables real-time adaptation to system changes.

### 2. Constrained Fuzzy Genetic Optimized Controller (CFGOC)
- Utilizes a Genetic Algorithm (GA) to tune fuzzy membership functions.
- Considers physical limitations of thrusters (force and azimuth angle).
- Provides constrained yet optimized control performance.

---

## 🖥 System Architecture

### 🧪 Simulation Environment
- Developed fully in **MATLAB/Simulink**.
- Supports high-fidelity testing of control algorithms.

### 🛠 Physical Testbed
A 1:100 scale model of the Stena Don rig, equipped with:

- **Controller**: STM32F767 microcontroller
- **Actuators**: Four azimuth thruster drivers
- **Sensors**:
  - LiDAR for position detection
  - Compass (IMU) for heading estimation
- **Monitoring**: Remote supervisory control station

---

## 🧰 Requirements

| Tool                  | Version      |
|-----------------------|--------------|
| MATLAB                | R2023b or newer |
| Simulink              | Included     |
| Fuzzy Logic Toolbox   | Required     |
| Global Optimization Toolbox | Required |

---

## 🚀 Getting Started

### ▶️ Simulation

```matlab
% Step 1: Initialize model
run Parameter.m

% Step 2: Add GNC toolbox to path

% Step 3: Open and run model
open('1.Simulation/DP_GA_DeltaM.slx')
````

### 🧪 Hardware Deployment

```matlab
% Step 1: Initialize hardware parameters
run Parameter.m

% Step 2: Open deployment model
open('2.Experiment/CFGOC_SSPUT02.slx')

% Step 3: Build and flash to STM32F767
% Use "Build, Load & Run" in Simulink
```

---

## 🗂 Directory Layout

* **`0. Configuration Parameter/`**: Scripts for initializing fuzzy rules and system parameters
* **`1. Simulation/`**: Models, simulation scripts, and sample results
* **`2. Experiment/`**: Embedded code, hardware schematics, and STM32 setup
* **`3. Results/`**: Data from both simulations and physical experiments

---

## 🤝 Contribution & Contact

Maintained by the **AIT Research Group**.
For issues, suggestions, or contributions, please open an issue or contact the project maintainer.

---
## 🎥 Demo Video

Click the image below to watch the real-time demonstration of the semi-submersible platform control system:

[![Watch the demo](https://img.youtube.com/vi/e18lg5iSBCU/2.jpg)](https://www.youtube.com/watch?v=e18lg5iSBCU)
## 📄 License
---
MIT License
© 2025 AIT Research Group. All rights reserved.


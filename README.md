[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2023b%2B-blue)](https://www.mathworks.com/)

# Fuzzy-Genetic Control System for Semi-Submersible Platform Dynamic Positioning

This project focuses on the control of a semi-submersible platform using a approach that combines Genetic Algorithms and Fuzzy Logic. The primary objective is to develop and validate adaptive control strategies for the semi-submersible platform in both simulation and experimental conditions.
---
## 🛠️ Dynamic Modeling

The dynamic model is developed based on the  **Stena Don rig**:

- Analysis of the motion structure and dynamic behavior of the semi-submersible system.  
- Definition of different operational modes, including dynamic position and trajectory following.  
- Analysis of environmental and mechanical factors negative impact on system performance.  
- Simulation in the **MATLAB/Simulink** to evaluate control effectiveness and dynamic stability.
---

## ⚙️ Control Methods

### 1. Adaptive Fuzzy Controller (AFC)
- Uses position and velocity error are inputs.
- Applies fuzzy inference rules to determine control action.
- Enables real-time adaptation to system changes.

### 2. Constrained Fuzzy Genetic Optimized Controller (CFGOC)
- Utilizes a Genetic Algorithm (GA) to tune fuzzy membership functions.
- Considers physical limitations of thrusters (force and azimuth angle)to constrains.
- Provides constrained yet optimized control performance.

---

## 🖥 System Architecture

### 🧪 Simulation Environment
- Developed fully in **MATLAB/Simulink**.
- Supports high-fidelity testing of control algorithms.

### 🛠 Physical Testbed
A 1:100 scale model of the Stena Don rig, equipped with:

- **Controller**: STM32F767 microcontroller
- **Actuators**: Four azimuth thruster + driver motor
- **Sensors**:
  - LiDAR for position detection
  - Compass (IMU) for heading estimation
- **Monitoring**: Remote supervisory control station

---

## 🧰 Requirements

| Tool                  | Version      |
|-----------------------|--------------|
| MATLAB                | R2023b or latest |
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
HOME -> Set Path -> Add with Subfolders... .Then choose 0. Configuration parameters -> GNC Library -> click Select Folder -> Save
% Step 3: Open and run model
open('1.Simulation/DP_GA_DeltaM.slx')
````

### 🧪 Hardware Deployment

```matlab
% Step 1: Initialize hardware parameters
run Parameter.m

% Step 2: Initialize Simulink Coder Support Package for STMicroelectronics Nucleo Boards.
```
[link_Package](https://www.mathworks.com/matlabcentral/fileexchange/58942-simulink-coder-support-package-for-stmicroelectronics-nucleo-boards)
```
% Step 3: Open deployment model
open('2.Experiment/CFGOC_SSPUT02.slx')

% Step 4: Build and Load to STM32F767
% Using "Build, Load & Run" in Simulink
% Using  "Monitor & Ture" to obserers real time
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
© Copyright 2025 AIT Research Group. All rights reserved.


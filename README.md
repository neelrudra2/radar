# Real-Time Radar Sweep Simulation (MATLAB)

A cinematic, real-time radar simulation built using MATLAB — featuring a rotating radar sweep line, visual target detection, and synchronized audio feedback. Inspired by classic military radar UIs, this project is tailored for aerospace and defense signal visualization demos.

---

## Features

- **Realistic Radar UI** with deep green circular rings and polar grid
- **Rotating Sweep Line** that scans 360° continuously (clockwise)
- **Target Detection**: Blips flash green when intercepted by the sweep
- **Synchronized Beep Sound** on each hit using low-latency `audioplayer`
- **Infinite Animation Loop** for live demo and presentation usage

---

![Radar](https://github.com/user-attachments/assets/cf39a706-c8f1-4b8a-8655-13d2971c7c3b)


---

## Technologies Used

- **MATLAB**
  - Polar plotting
  - Signal generation
  - Real-time GUI animation
  - `audioplayer` for precise sound sync

---

## How It Works

1. Define target positions using angles and range values.
2. Animate a sweep line rotating from 0° to 359°, repeating forever.
3. Check angular difference with each target — flash and beep on hit.
4. Radar UI simulates a military-grade tracking system.

---

## Setup & Run

> **Requirements:** MATLAB R2018 or newer  
> **Recommended:** Speakers/headphones for audio feedback

### To Run the Simulation:

```matlab
% In MATLAB Command Window or Editor:
radar.m

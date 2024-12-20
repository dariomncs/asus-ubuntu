# ASUS G14 2024 Ubuntu 24.04 Setup Scripts

This repository contains scripts and tools to help set up Ubuntu 24.04 on the ASUS G14 2024 laptop (or similar models). These scripts aim to streamline the process of getting essential utilities, sound functionality, and optimal performance on this device.

> **Note:** All scripts and instructions are provided **as-is**, without warranty. Use them at your own discretion and risk.

---

## Features and recommendations

1. **ASUS Linux Utilities Package Generator**  
   Includes a script to generate ubuntu packages for https://asus-linux.org/ utilities:
    - [`asusctl`](https://gitlab.com/asus-linux/asusctl) 
    - [`supergfxctl`](https://gitlab.com/asus-linux/supergfxctl)
   essential tools for managing ASUS laptops on Linux.

2. **Sound Configuration Script**  
   A script to enable and fix sound functionality, tailored for the ASUS G14 2024 hardware (use it if you have issues with speakers).

3. **Linux Kernel Recommendation**  
   These laptops use cutting-edge hardware and work best with Linux kernel version **6.11** or preferably **6.12**. You can install these kernels using:
   - [Xanmod](https://xanmod.org/)
   - [Liquorix](https://liquorix.net/)

4. **NVIDIA Driver Setup**  
   For systems with NVIDIA GPUs, proper driver installation is crucial. Follow the instructions in this guide:  
   [NVIDIA-Ubuntu-Driver-Guide](https://github.com/oddmario/NVIDIA-Ubuntu-Driver-Guide?tab=readme-ov-file#-installing-through-the-graphics-drivers-ppa-repository-recommended)

---

## How to Use

1. **Clone this repository:**
   ```bash
   git clone https://github.com/dariomncs/asus-ubuntu.git
   cd asus-ubuntu
   ```

2. **Generate and install ASUS Linux utilities:**
   ```bash
   ./asus-ubuntu-builder.sh
   sudo dpkg -i target/asusctl*.deb # Install the ASUS Linux utilities
   sudo dpkg -i target/supergfxctl*.deb # Install the SuperGFXCTL utility for GPU switching
   ```

3. **Fix sound functionality:**
   ```bash
   ./cirrus-fix.sh
   ```

4. **Install recommended Linux kernel:**
   - Visit [Xanmod](https://xanmod.org/) or [Liquorix](https://liquorix.net/) and follow the instructions to install the latest kernel.

5. **Install NVIDIA drivers (if applicable):**
   Follow the guide [here](https://github.com/oddmario/NVIDIA-Ubuntu-Driver-Guide?tab=readme-ov-file#-installing-through-the-graphics-drivers-ppa-repository-recommended).

---
## Known Issues

- **Headset Microphone:** The headset microphone may not work out of the box. 

---

## Contributing

Contributions are welcome! If you have improvements or fixes, feel free to open a Pull Request (PR). Let’s make this setup process smoother for everyone.

1. Fork the repository.
2. Create a new branch for your changes.
3. Submit your PR with a clear description of the changes.

---

## Disclaimer

This repository is maintained as a community effort. The scripts and guides provided here are intended for the **ASUS G14 2024** laptop running **Ubuntu 24.04**. They are offered with no warranty or guarantee of success. Always back up your data and proceed with caution.

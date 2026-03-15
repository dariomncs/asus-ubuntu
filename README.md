# ASUS G14 2024 Ubuntu Setup Scripts

This repository contains scripts and tools to help set up Ubuntu on the ASUS G14 2024 laptop and similar models. The goal is to streamline access to essential utilities, sound fixes, and performance-related setup steps for this hardware.

> **Note:** All scripts and instructions are provided **as-is**, without warranty. Use them at your own discretion and risk.

---

## Features and recommendations

1. **ASUS Linux Utilities Package Generator**  
   Provides a package builder for the following ASUS Linux utilities:
    - [`asusctl`](https://gitlab.com/asus-linux/asusctl) 
    - [`supergfxctl`](https://gitlab.com/asus-linux/supergfxctl)
   These are essential tools for managing ASUS laptops on Linux.

2. **Sound Configuration Script**  
   Provides a script to enable and improve sound functionality, tailored for the ASUS G14 2024 hardware. Use it if you have issues with the speakers.

3. **Linux Kernel Recommendation**  
   These laptops use cutting-edge hardware and work best with Linux kernel version **6.12** or later. The current setup has been tested with **6.18**. You can install newer kernels using:
   - [XanMod](https://xanmod.org/)
   - [Liquorix](https://liquorix.net/)

4. **NVIDIA Driver Setup**  
   For systems with NVIDIA GPUs, proper driver installation is crucial. Follow the instructions in this guide:  
   [NVIDIA-Ubuntu-Driver-Guide](https://github.com/oddmario/NVIDIA-Ubuntu-Driver-Guide?tab=readme-ov-file#-installing-through-the-graphics-drivers-ppa-repository-recommended)  
   If you are using the XanMod kernel, please also refer to the official [XanMod](https://xanmod.org/) documentation for **NVIDIA Graphics Drivers**, as it provides the proper packages for XanMod kernel builds.

---

## How to Use

1. **Clone this repository:**
   ```bash
   git clone https://github.com/dariomncs/asus-ubuntu.git
   cd asus-ubuntu
   ```

2. **Configure and generate ASUS Linux utilities:**
   Edit the configuration variables in [asus-ubuntu-builder.sh](./asus-ubuntu-builder.sh) if you want to change the package versions or the Ubuntu version used for the Docker build environment.

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
   - Visit [XanMod](https://xanmod.org/) or [Liquorix](https://liquorix.net/) and follow their instructions to install a recent kernel.

5. **Install NVIDIA drivers (if applicable):**
   Follow the guide [here](https://github.com/oddmario/NVIDIA-Ubuntu-Driver-Guide?tab=readme-ov-file#-installing-through-the-graphics-drivers-ppa-repository-recommended). If you are using the XanMod kernel, also refer to the official [XanMod](https://xanmod.org/) documentation for **NVIDIA Graphics Drivers**, as it provides the proper packages for XanMod kernel builds.

---
## Known Issues

- ✅ **Headset microphone:** This issue appears to be resolved in recent kernel versions, so it may already work out of the box.

---

## Contributing

Contributions are welcome. If you have improvements or fixes, feel free to open a Pull Request (PR). The goal is to keep this setup process as smooth and current as possible for everyone.

1. Fork the repository.
2. Create a new branch for your changes.
3. Submit your PR with a clear description of the changes.

## Sharing and Credits

If you share these scripts, publish a guide based on them, or build improvements on top of this work, please consider linking back to this repository as the main source. Keeping a single reference point helps others find the latest updates, and contributing fixes or useful improvements back here helps keep the shared solution accurate and up to date for everyone.

### Special Thanks

A big thank you to the [Asus-Linux.org](https://asus-linux.org) project and its contributors. Their outstanding work on open-source ASUS Linux support — including the [`asusctl`](https://gitlab.com/asus-linux/asusctl) and [`supergfxctl`](https://gitlab.com/asus-linux/supergfxctl) utilities — makes running Linux on ASUS hardware a much better experience for everyone.

---

## Disclaimer

This repository is maintained as a community effort. The scripts and guides provided here are intended for the **ASUS G14 2024** laptop running Ubuntu, with **24.04** as the default target for the package builder. They are offered with no warranty or guarantee of success. Always back up your data and proceed with caution.

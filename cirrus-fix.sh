#!/bin/bash

cd /tmp

wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp1.bin
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp2.bin
chmod 644 cs35l56-b0-dsp1-misc-10431b13-spkid*
sudo chown root:root cs35l56-b0-dsp1-misc-10431b13-spkid*
sudo mv cs35l56-b0-dsp1-misc-10431b13-spkid* /lib/firmware/cirrus/
cd /lib/firmware/cirrus 

sudo ln -s cs35l56/CS35L56_Rev3.11.16.wmfw.zst cs35l56-b0-dsp1-misc-10431b13.wmfw.zst
sudo ln -s cs35l56/CS35L56_Rev3.11.16.wmfw.zst cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw.zst
sudo ln -s cs35l56/CS35L56_Rev3.11.16.wmfw.zst cs35l56-b0-dsp1-misc-10431b13-spkid1.wmfw.zst

sudo update-initramfs -u
#!/bin/bash
set -euo pipefail
cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

build_dir=$(mktemp -d)
target_dir="$(pwd)/target"
rm -rf "$target_dir"
mkdir -p "$target_dir"

cleanup() {
  if [[ -d "$build_dir" ]]; then
    rm -rf "$build_dir"
  fi
}

trap cleanup exit

cd "$build_dir"

function create_dockerfile() {
  local app_name="$1"
  local git_url="$2"
  local target_version="$3"
  local dependencies="$4"
  local build_commands="$5"
  local additional_files="$6"
  
  cat <<EOF >Dockerfile
ARG UBUNTU_VERSION="24.04"

FROM ubuntu:\${UBUNTU_VERSION}

RUN DEBIAN_FRONTEND=noninteractive apt update -qqy \
    && apt install -qqy cmake curl g++ git pkg-config ruby build-essential $dependencies \
    && gem install fpm \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV TARGET_VERSION="$target_version"
RUN git clone --depth 1 --branch \$TARGET_VERSION $git_url

WORKDIR /$app_name

RUN . "\$HOME/.cargo/env" \
    && make

$build_commands

RUN fpm -s dir -t deb -C /target \
    --name $app_name \
    --license MPL-2.0 \
    --version \$TARGET_VERSION \
    --iteration 1 \
    --description "$app_name is a utility for Linux related to ASUS laptops." \
    --url "https://gitlab.com/asus-linux/$app_name" \
    --depends libudev1 $additional_files \
    . \
    && rm -rf /target \
    && mkdir /target \
    && mv *.deb /target

EOF
}

function build_package() {
  local app_name="$1"
  local git_url="$2"
  local target_version="$3"
  local dependencies="$4"
  local build_commands="$5"
  local additional_files="$6"

  create_dockerfile "$app_name" "$git_url" "$target_version" "$dependencies" "$build_commands" "$additional_files"

  docker build -t "${app_name}-builder" .
  cid=$(docker create "${app_name}-builder")
  docker cp "$cid:/target/" .
  docker rm $cid
  cp target/${app_name}_*.deb "$target_dir/"
  rm -rf target
}

# Build asusctl package
build_package "asusctl" \
"https://gitlab.com/asus-linux/asusctl.git" \
"6.0.12" \
"libasound2-dev libfreetype6-dev libexpat1-dev libxcb-composite0-dev libssl-dev \
libx11-dev libfontconfig1-dev libclang-dev libseat-dev libinput-dev libxkbcommon-dev \
libgbm-dev libgtk-3-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libglib2.0-dev" \
"RUN make DESTDIR=/target install" \
"--depends libgtk-3-0 --depends libpango-1.0-0 --depends libgdk-pixbuf-2.0-0 --depends libglib2.0-0 --depends libclang1 --depends libudev1 --depends libseat1"

# Build supergfxctl package
build_package "supergfxctl" \
"https://gitlab.com/asus-linux/supergfxctl.git" \
"5.2.4" \
"libudev-dev" \
"$(cat <<SUPERGFXCTL
RUN make DESTDIR=/target install && mkdir -p /target/etc/modprobe.d/ && cat <<MODPROBE >> /target/etc/modprobe.d/supergfxd.conf
# 0x00 - no power management, 0x01 - coarse power management, 0x02 - fine power management
# options nvidia NVreg_DynamicPowerManagement=0x02
MODPROBE
SUPERGFXCTL
)" \
"--depends libudev1"

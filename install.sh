#!/usr/bin/env bash

# Check if this is running with root permissions - it should not be
if [[ "$EUID" = 0 ]]; then
    echo "Running this script as root may break things. Please run without superuser permissions."
    exit
fi

TEMP_DIR=$(pwd)

if [[ -f "/etc/os-release" ]]; then
    source /etc/os-release
    ID=$ID
    case "$ID" in
        arch|endeavour|manjaro)
            echo "Using pacman to update, install dependancies, and Paru..."
            sudo pacman -S --noconfirm git cmake

            git clone https://aur.archlinux.org/paru.git
            cd $TEMP_DIR/paru
            makepkg -si
            cd $TEMP_DIR
            rm -rf paru

            paru -S --noconfirm pico-sdk
            ;;
        *)
            echo "Error: Unsupported distribution. Exiting..."
            exit
            ;;
    esac
else
    echo "Error: /etc/os-release not found. Exiting..."
    exit
fi

echo "Building..."
cd src
mkdir build && cd build

export PICO_SDK_PATH=/usr/share/pico-sdk

cmake ..
make -j2

cd $TEMP_DIR

echo "Compilation complete. Please move the compiled .uf2 file onto the Pico."
exit

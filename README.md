# SolarPi

## About

This is the source code for an RP2040-based solar tracker for efficient energy harvesting.

## Section 1: Prerequisites

For your convenience, the necessary `solar.uf2` will be included in the case you would simply like to replicate the project, however in the case you wish to customize/edit it, you will need to make sure you have a few things installed.

### 1.1 SUPPORTED PLATFORMS

This is designed to work best on Linux platforms using Raspberry Pi's Pico SDK in conjunction with GCC. The instructions below will be for Arch Linux in particular

### 1.2 DEPENDENCIES

The Raspberry Pi Pico uses an ARM-based chip - the RP2040 (or RP2350 in the case of the Pico 2, which is not officially supported). As such, it is necessary to have a cross-compiler toolchain to be able to build the software. To handle this, we would ordinarily install `extra/arm-none-eabi-gcc`, however the AUR build script pulls this in by itself.

You can use `makepkg` to install this, though an AUR helper makes the install process and updates much easier. 

> ⚠️ **Warning:** DO NOT attempt run `makepkg` as root (`sudo`)! See the [Arch Wiki](https://wiki.archlinux.org/title/Makepkg) for more info.

```sh
sudo pacman -S git

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

Once this is installed, you can use this to run the install script for the SDK and to install CMake (on other distributions, make sure you have CMake version >= 3.13 and install the SDK as detailed by the docs).

```sh
paru -S pico-sdk cmake
```

## Section 2: Building

### 2.1 SETUP

To compile and build the software from source, first clone the repo, then make and navigate to a build directory under the software folder.

```sh
git clone https://github.com/aur0rae/SolarPi

cd SolarPi/src
mkdir build && cd build
```

### 2.2 COMPILE

Next, set the proper environment variable and us GNU Make and CMake to automatically compile everything with the right flags.

> 📝 Note: Running `make -jX` will allow you to use more of your processor during the compile process. According to the [Gentoo Wiki](https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Stage#MAKEOPTS), you should set this to be either the number of threads you have, or your RAM in GB divided by 2 (whichever comes first).

```sh
export PICO_SDK_PATH=/usr/share/pico-sdk

cmake ..
make -j10 # This should be changed depending on your processor
```

### 2.3 DEPLOYING

To run the resultant program on the Pico, mount it by plugging the device in while depressing the BOOTSEL button. After a few seconds, the system should recognize it as a bulk storage device.

From there, simply drag and drop the `.uf2` file from the build directory onto the Pi, and reboot it.

## Credits

Big thanks to Raspberry Pi for providing an excellent starting point and trivializing (relatively) the process for me!

- Raspberry Pi's [C/C++ SDK](https://www.raspberrypi.com/documentation/microcontrollers/c_sdk.html)

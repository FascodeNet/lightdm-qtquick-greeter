# lightdm-qtquick-greeter
A Greeter for LightDM with switchable themes written in QtQuick for Alter Linux and Serene Linux

# Usage

## Build from source

### Arch Linux
Install package `lightdm-qtquick-greeter-git` from AUR

```bash
yay -S lightdm-qtquick-greeter-git
```

### Fedora
#### Make dependencies

- lightdm-qt-devel
- cmake
- ninja-build

## other distro

### Make dependencies

Install folllowing packages

 - liblightdm-qt
 - cmake
 - ninja


## Build and Install

```bash
git clone https://github.com/FascodeNet/lightdm-qtquick-greeter.git
cd lightdm-qtquick-greeter
mkdir build
cd build
cmake -GNinja ..
ninja -j4
sudo ninja install
```
## Set up Lightdm
Follow [the instructions on ArchWiki](https://wiki.archlinux.org/index.php/LightDM#Greeter) to specify Greeter.

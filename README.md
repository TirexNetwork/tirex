![image](https://tirex.network/10132526.jpg)







## Compiling Tirex from source

### System Memory

The build process can consume upto 13GB of memory and may fail if enough resources are not available.
In some build scenarios it may be necessary to increase the size of the SWAP to compensate for less RAM.

For example if you have 8GB of RAM, then your SWAP size should be 5GB

-   Ubuntu / Linux

```bash
sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

-   Rasberry Pi OS

```bash
sudo dphys-swapfile swapoff
sudo nano /etc/dphys-swapfile
CONF_SWAPSIZE=5120
sudo nano /sbin/dphys-swapfile
#CONF_MAXSWAP=2048
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
```

### Linux / Ubuntu / Debian

#### Prerequisites

-   You will need the following dependencies to build the Tirex CLI: boost, cmake, git, gcc, g++, python, and make:

```bash
sudo apt update
sudo apt-get install -y build-essential python-dev gcc g++ git cmake libboost-all-dev
```

#### Building

-   On Ubuntu:

```bash
git clone https://github.com/TirexNetwork/tirex
cd tirex
mkdir build
cd build
cmake ..
make
```

If the build is successful the binaries will be in the `src` folder.

### ARM / Raspberry Pi

Tested on a Raspberry Pi 4 with Raspberry Pi OS (32/64bit) images.

Other ARM CPU/OS combinations should be possible if the CPU supports Neon/AES.

-   Follow the Linux / Ubuntu procedure to build.

### Windows 10

#### Prerequisites

-   Install [Visual Studio 2019 Community Edition](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=16)
    > When installing Visual Studio, you need to install **Desktop development with C++** and the **MSVC v142 - VS 2019 C++ x64/x86 build tools** components. The option to install the v142 build tools can be found by expanding the "**Desktop development with C++**" node on the right. You will need this for the project to build correctly.
-   Install [CMake](https://cmake.org/download/)
-   Install [Boost](https://sourceforge.net/projects/boost/files/boost-binaries/1.78.0/boost_1_78_0-msvc-14.2-64.exe/download), **ensuring** you download the installer for **MSVC 14.2**. 
    > The instructions will be given for Boost 1.78.0. Using a different version should be supported but you will have to change the version where required.

#### Building

-   From the start menu, open 'x64 Native Tools Command Prompt for vs2019' or run "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\Common7\\Tools\\VsMSBuildCmd.bat" from any command prompt.

```ps
git clone https://github.com/TirexNetwork/tirex
cd tirexe
mkdir build
cd build
cmake .. -G "Visual Studio 16 2019" -A x64 -DBOOST_ROOT="c:\local\boost_1_78_0"
msbuild tirex.sln /p:Configuration=Release /m
```

If the build is successful the binaries will be in the `src/Release` folder.

### macOS

#### Prerequisites

-   In order to install prerequisites, [XCode](https://developer.apple.com/xcode/) and [Homebrew](https://brew.sh/) needs to be installed.
    Once both are ready, open Terminal app and run the following command to install additional tools:

```bash
xcode-select --install
```

-   On newer macOS versions (v10.14 and higher) this step is done through Software Update in System Preferences.

-   After that, proceed with installing dependencies:

```bash
brew install git cmake boost
```

#### Building

-   When all dependencies are installed, build Tirex Core binaries:

```bash
git clone https://github.com/TirexNetwork/tirex
cd tirex
mkdir build
cd build
cmake ..
make
```

If the build is successful the binaries will be located in the `src` folder.

#### Special Thanks

Special thanks goes out to the developers from Cryptonote, Bytecoin, Ryo, Monero, Forknote, TurtleCoin, Karbo and Masari.
#!/bin/sh

EFI_FILE="BOOTX64.EFI"

if [ ! -e "edk2" ]; then
    git clone https://github.com/tianocore/edk2.git
    cd edk2
    git checkout 38c8be123aced4cc8ad5c7e0da9121a181b94251
    make -C BaseTools/Source/C
    source edksetup.sh
    cd ..
fi

cp conf/target.txt edk2/Conf/target.txt
cp conf/tools_def.txt edk2/Conf/tools_def.txt

export PACKAGES_PATH=${PWD}

cd edk2
build
cd ..

cp edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi ${EFI_FILE}

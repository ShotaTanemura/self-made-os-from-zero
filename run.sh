#!/bin/sh

./build_src.sh

./build_img.sh

sudo qemu-system-x86_64 \
    -drive if=pflash,file=$HOME/osbook/devenv/OVMF_CODE.fd \
    -drive if=pflash,file=$HOME/osbook/devenv/OVMF_VARS.fd \
    -hda disk.img \
    -vnc :0

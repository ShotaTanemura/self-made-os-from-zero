DISK_IMG="disk.img"
EFI_FILE="BOOTX64.EFI"

rm -f ${DISK_IMG}
qemu-img create -f raw ${DISK_IMG} 200M
mkfs.fat -n 'MIKAN OS' -s 2 -f 2 -R 32 -F 32 ${DISK_IMG}

mkdir -p mnt
sudo mount -o loop disk.img mnt
sudo mkdir -p mnt/EFI/BOOT
sudo cp src/${EFI_FILE} mnt/EFI/BOOT/BOOTX64.EFI
sudo umount mnt


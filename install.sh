#!/bin/bash

mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
pacstrap /dev/sda2 base linux linux-firmware
arch-chroot /mnt
pacman -S grub networkmanager
grub-install --target=x86_64-efi --efi-directory=/boot/efi

passwd
echo archlinux > /etc/hostname
echo "127.0.0.1     localhost archlinux"
exit
genfstab -U >> /mnt/etc/fstab

reboot
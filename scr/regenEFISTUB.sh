# Note: If you accidently delete the kernal files, just: 4 pacman -S linux
# Remove the old linux kernal files
rm -R /boot/efi/EFI/arch/vmlinuz-linux
rm -R /boot/efi/EFI/arch/initramfs-linux.img
rm -R /boot/efi/EFI/arch/initramfs-linux-fallback.img

# Copy over the new files
cp -f /boot/vmlinuz-linux /boot/efi/EFI/arch/vmlinuz-linux
cp -f /boot/initramfs-linux.img /boot/efi/EFI/arch/initramfs-linux.img
cp -f /boot/initramfs-linux-fallback.img /boot/efi/EFI/arch/initramfs-linux-fallback.img


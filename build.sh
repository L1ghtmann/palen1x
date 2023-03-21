#!/usr/bin/env bash
#
# palen1x-surface build script
# OG script made with <3 https://github.com/palera1n/palen1x
# Modified from https://github.com/asineth0/checkn1x & https://github.com/raspberryenvoie/odysseyn1x :3

# Exit if user isn't root
if [[ $EUID -ne 0 ]]; then
	echo "$0: This script must be run with sudo or as su. Exiting."
	exit 1
fi

GREEN="$(tput setaf 2)"
BLUE="$(tput setaf 6)"
NORMAL="$(tput sgr0)"
cat << EOF

		   Welcome to                 ${GREEN}&&&%##%%(${NORMAL}
							   ${GREEN}&&&&&&&&&&&%#&&%%%${NORMAL}
						${GREEN}&&&&&&&&&&&&&&&&&&%%#&&&%%%${NORMAL}
				${BLUE}&&&&&&&&${NORMAL}#############${GREEN}&&&%%&%%&&&&%%%${NORMAL}
		 ${BLUE}%%%%%%%%%%%%&&&${NORMAL}#  ${BLUE}palen1x-surface${NORMAL}  #${GREEN}%&&&&%%%%%%%%%%%%${NORMAL}
	 ${BLUE}#######((((###%%%%%${NORMAL}#############${GREEN}&%%%%%%%${NORMAL}
	 ${BLUE}######/     ########%%%%&&&&&&&%%${NORMAL}
	  ${BLUE}((((((((((((######%%%%%%%${NORMAL}
	   ${BLUE}(((((((((#####%%*${NORMAL}
		${BLUE}/(((((##${NORMAL}                  build script

EOF

# Install dependencies to build palen1x-surface
apt-get update
apt-get install -y --no-install-recommends ca-certificates cpio curl debootstrap grub2-common grub-efi-amd64-bin grub-pc-bin gzip mtools tar xorriso xz-utils

VERSION="$(cat version)"
PALERA1N='https://github.com/palera1n/palera1n/releases/latest/download/palera1n-linux-x86_64'

# Clean up previous attempts
umount -v work/rootfs/{dev,sys,proc} >/dev/null 2>&1
rm -rf work
mkdir -pv work/{rootfs,iso/boot/grub}
cd work

# Fetch ROOTFS
debootstrap --arch=amd64 --variant=minbase bookworm rootfs http://deb.debian.org/debian/
mount -vo bind /dev rootfs/dev
mount -vt sysfs sysfs rootfs/sys
mount -vt proc proc rootfs/proc
cat << ! | chroot rootfs
# apt install -y --no-install-recommends extrepo
# extrepo enable surface-linux
apt update && apt install -y --no-install-recommends ca-certificates curl gnupg
curl -fsSL https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/HEAD/mynewt.gpg.key | gpg --dearmor -o /usr/share/keyrings/mynewt.gpg.key
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/mynewt.gpg.key] \
	https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master latest main" \
	| tee -a /etc/apt/sources.list.d/mynewt.list > /dev/null
apt update && apt install -y --no-install-recommends linux-image-amd64 \
														linux-headers-amd64 \
														sysvinit-core \
														openrc \
														dkms \
														make \
														git
git clone --recursive --depth=1 https://github.com/linux-surface/surface-aggregator-module/ sam/
cd sam/module/
# build for chroot kernel not host
sed -i 's@uname -r@ls /lib/modules/@g' Makefile
sed -i 's@dkms add@dkms add -k \$(shell ls /lib/modules/)@' Makefile
sed -i 's@dkms build@dkms build -k \$(shell ls /lib/modules/)@' Makefile
sed -i 's@dkms install@dkms install -k \$(shell ls /lib/modules/)@' Makefile
make -j && make dkms-install
apt remove -y ca-certificates curl gnupg dkms make git && apt autoremove -y
apt install -y --no-install-recommends ncurses-base \
										openssh-client \
										sshpass \
										usbmuxd \
										whiptail \
										newt
apt clean
!

# Echo TUI configurations
echo 'palen1x-surface' > rootfs/etc/hostname
echo "PATH=$PATH:$HOME/.local/bin" >> rootfs/root/.bashrc
echo "export PALEN1X_VERSION='$VERSION'" >> rootfs/root/.bashrc
echo '/usr/bin/palen1x_menu' >> rootfs/root/.bashrc
echo "Rootful" > rootfs/usr/bin/.jbtype
echo "" > rootfs/usr/bin/.args

# Unmount fs
umount -v rootfs/{dev,sys,proc}

# Fetch palera1n-c
curl -Lo rootfs/usr/bin/palera1n "$PALERA1N"

# Copy files
cp -av ../inittab rootfs/etc
cp -av ../scripts/* rootfs/usr/bin
chmod -v 755 rootfs/usr/bin/*
ln -sv sbin/init rootfs/init

# Boot config
cp -av rootfs/boot/vmlinuz-* iso/boot/vmlinuz
cat << ! > iso/boot/grub/grub.cfg
insmod all_video
echo 'palen1x-surface $VERSION by Lightmann'
echo 'OG script by palen1x team'
echo 'One moment please ....'
linux /boot/vmlinuz quiet loglevel=3 3
initrd /boot/initramfs.xz
boot
!

# initramfs
pushd rootfs
rm -rfv tmp/* boot/* var/cache/* var/lib/apt/lists/* etc/resolv.conf
find . | cpio -oH newc | xz -C crc32 --x86 -vz9eT$(nproc --all) > ../iso/boot/initramfs.xz
popd

# ISO creation
grub-mkrescue -o "c-palen1x-surface-$VERSION.iso" iso --compress=xz

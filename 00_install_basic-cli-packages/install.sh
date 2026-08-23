#!/bin/bash
# ACTION: Install some basic CLI packages
# INFO: Debian netinstall comes with few list of CLI installed packages
# INFO: Some basic packages are: vim zip unzip rar unrar mtp-tools mailutils traceroute acl gnupg2 plocate apt-transport-https curl ntfs-3g
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install free packages
echo "--------------------------------------------------------------------"
echo "                    00_install_basic-cli-packages                   "
echo "--------------------------------------------------------------------"
echo -e "\e[1mInstalling packages...\e[0m"
[ "$(find /var/cache/apt/pkgcache.bin -mtime 0 2>/dev/null)" ] || apt-get update  

apt-get install -y base-files mount procps udev base-passwd bash coreutils dpkg apt systemd systemd-sysv util-linux login passwd tzdata locales ca-certificates usb.ids
apt-get install -y  less zip unzip  unrar p7zip-full   traceroute acl gnupg2 plocate apt-transport-https curl wget ntfs-3g file p11-kit p11-kit-modules
# apt install -y mtp-tools mailutils
apt install -y git
apt install -y curl 

echo -e "\e[1mDone...\e[0m"

#!/bin/bash
# ACTION: Install script to rotate everyday Linux solarized wallpapers pack by Andreas Linz
# INFO: wallpaper-rotate script rotate everyday a link to a wallpaper file
# DEFAULT: y

# Config variables
base_dir="$(dirname "$(readlink -f "$0")")"

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install dependences
echo "--------------------------------------------------------------------"
echo "                    10_openbox_wallpaper-rotate.                    "
echo "--------------------------------------------------------------------"

if ! which anacron &>/dev/null; then
	echo -e "\e[1mInstalling packages...\e[0m"
	[ "$(find /var/cache/apt/pkgcache.bin -mtime 0 2>/dev/null)" ] || apt-get update  
	apt install -y anacron
fi

# Copy rotate script in cron.daily dir
echo -e "\e[1mInstalling script...\e[0m"
f="wallpaper-rotate"
cp -v "${base_dir}/$f" /etc/cron.daily/
chmod a+x "/etc/cron.daily/$f"

echo -e "\n\e[1mDone...\e[0m\n"


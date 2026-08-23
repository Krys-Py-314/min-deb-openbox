#!/bin/bash
# ACTION: Install some basic GUI packages
# INFO: Debian netinstall comes with few list of GUI installed packages
# INFO: Some basic packages are: vlc gmtp mtp-tools synaptic galternatives evince firmware-linux-nonfree
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install free packages
echo "--------------------------------------------------------------------"
echo "           05_install_basic-gui-oackages and tools                  "
echo "--------------------------------------------------------------------"


echo -e "\n\e[1mInstalling packages...\e[0m\n"
[ "$(find /var/cache/apt/pkgcache.bin -mtime 0 2>/dev/null)" ] || apt-get update  
apt-get install -y vlc gmtp synaptic galternatives evince xdotool gparted imagemagick
apt-get install -y firmware-linux-nonfree
  
echo -e "\e[1mDone...\e[0m"

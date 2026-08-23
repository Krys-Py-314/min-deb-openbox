#!/bin/bash
# ACTION: Install vim editor, and apply some configs and plugins
# INFO: Install vim-gtk3, plug plugin manager, airline statusbar and hybrid-material colorsheme
# DEFAULT: y



# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install leafpad
echo "--------------------------------------------------------------------"
echo "                 50_install_leafpad .                          "
echo "--------------------------------------------------------------------"

echo "Installing LeafPad"
apt install -y l3afpad
cat << EOF >> ~/.bashrc
alias leafpad="l3afpad"
alias edit="l3afpad"
EOF
source ~/.bashrc

echo -e "\n\e[1mDone...\e[0m\n"

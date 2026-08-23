#!/bin/bash
# ACTION: Install Terminator terminal and configs
# INFO: Openbox dont include a virtual terminal tool
# DEFAULT: y

# Config variables
base_dir="$(dirname "$(readlink -f "$0")")"

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

echo "--------------------------------------------------------------------"
echo "                    10_openbox_terminal.                            "
echo "--------------------------------------------------------------------"

echo -e "\e[1mInstalling packages...\e[0m"
echo -e "\e[1mDoing nothing XTerm is enough...\e[0m"
echo    " ..installing Nerd Fonts "
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/0xProto.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/Inconsolata.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/Iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/IosevkaTerm.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/UbuntuMono.zip
unzip 0xProto.zip && rm 0xProto.zip
unzip Inconsolata.zip && rm Inconsolata.zip
unzip IosevkaTerm.zip && rm IosevkaTerm.zip
unzip Iosevka.zip && rm Iosevka.zip
unzip JetBrainsMono.zip && rm JetBrainsMono.zip
unzip UbuntuMono.zip && rm UbuntuMono.zip
fc-cache -fv
cd ~

echo    " ..0xProto  Inconsolata Iosevka IosevkaTerm JetBrainsMono UbuntuMono fonts installed"

cat << EOF >> ~/.Xresources
xterm*faceName: JetBrainsMono Nerd Font Mono
xterm*faceSize: 11
EOF

xrdb -merge ~/.Xresources

sudo apt install curl
curl -s https://ohmyposh.dev/install.sh | bash -s

cat << EOF >> ~/.bashrc
export PATH=$PATH:/root/.local/bin
eval "$(oh-my-posh init bash)"
EOF

# Install packages
#echo -e "\e[1mInstalling packages...\e[0m"
#[ "$(find /var/cache/apt/pkgcache.bin -mtime 0 2>/dev/null)" ] || apt-get update  
#apt-get install -y terminator

# Copy users config
#echo -e "\e[1mSetting configs to all users...\e[0m"
#for d in /etc/skel/  /home/*/ /root; do
#	[ "$(dirname "$d")" = "/home" ] && ! id "$(basename "$d")" &>/dev/null && continue	# Skip dirs that no are homes 
#
#	# Create config folders if no exists
#	d="$d/.config/"; [ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$(dirname "$d")" -c %u:%g) "$d"
#	
#	f="helpers.rc"
#	[ ! -d "$d/xfce4" ] && mkdir -v "$d/xfce4" && chown -R $(stat "$(dirname "$d")" -c %u:%g) "$d/xfce4"
#	cp -v "$base_dir/$f" "$d/xfce4/" && chown -R $(stat "$(dirname "$d")" -c %u:%g) "$d/xfce4/$f"
#	
#	d="$d/terminator/"; [ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$(dirname "$d")" -c %u:%g) "$d"
#	f="config"
#	cp -v "$base_dir/$f" "$d/" && chown -R $(stat "$(dirname "$d")" -c %u:%g) "$d/$f"
#done


echo -e "\e[1mDone...\e[0m"

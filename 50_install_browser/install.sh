#!/bin/bash
# ACTION: Install Google Chrome, add to repositories and set has default browser
# INFO: Google Chrome is most popular web browser
# INFO: Its recommended config official repositories for weekly updates
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install repositories and update
echo "--------------------------------------------------------------------"
echo "                 50_install browser (vimb) .                        "
echo "--------------------------------------------------------------------"

# below was to install chrome
#if ! grep -R "dl.google.com/linux/chrome/deb/" /etc/apt/ &> /dev/null; then
#	echo -e "\e[1mConfiguring repositories...\e[0m"
#	wget -qO - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | gpg --dearmor --yes -o /usr/share/keyrings/googlechrome-keyring.gpg
#	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
#	apt-get update
#fi

# Install package
echo -e "\e[1mInstalling packages...\e[0m"
#apt-get install -y google-chrome-stable
apt-get remove chromium google-chrome-stable

apt install -y vimb 
cat << EOF > /usr/local/bin/vimb-browser
#!/bin/sh
exec /usr/bin/vimb "$@"
EOF
sudo chmod 755 /usr/local/bin/vimb-browser
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/local/bin/vimb-browser 50

echo -e "\n\e[1mDone...\e[0m\n"


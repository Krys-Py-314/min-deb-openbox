#!/bin/bash
# ACTION: Install OnlyOffice package and add to repositories
# INFO: OnlyOffice offers a secure online office suite highly compatible with MS Office formats
# DEFAULT: n


# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install repositories and update
echo "-----------------------------------------------------------"
echo "                   OnlyOffice"
echo "-----------------------------------------------------------"
echo "If you want to install OnlyOffice then do the following ..."

echo "if ! grep -R "onlyoffice.com" /etc/apt/ &> /dev/null; then "
echo "	wget -qO - \"https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE\" | gpg --dearmor --yes -o /usr/share/keyrings/onlyoffice-keyring.gpg"
echo "  echo \'deb [signed-by=/usr/share/keyrings/onlyoffice-keyring.gpg] https://download.onlyoffice.com/repo/debian squeeze main\' | sudo tee /etc/apt/sources.list.d/onlyoffice.list"
echo "	apt-get update"
echo "fi"

# Install package
echo "apt-get -y install onlyoffice-desktopeditors || exit 1"

echo -e "\n\e[1mNothing Installed...\e[0m\n"


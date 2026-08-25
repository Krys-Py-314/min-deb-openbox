#!/bin/bash
# ACTION: Add Debian repositories contrib, non-free and non-free-firmware
# INFO: Contrib, non-free and non-free-firmware repositories are not enabled by default in Debian install
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

echo "--------------------------------------------------------------------"
echo "                    00_config_add_contrib_non_free                  "
echo "--------------------------------------------------------------------"
echo -e "\e[1mAdding APT repositories contrig, non-free and non-free-firmware...\e[0m"
# Add contrib section
#deb_lines="$(egrep '^(deb|deb-src) (http://deb.debian.org/debian/|http://security.debian.org/debian-security)' /etc/apt/sources.list |  egrep -Ev "contrib([[:space:]]|$)")"
#IFS=$'\n'
#for l in $deb_lines; do
#	sed -i "s\\^$l$\\$l contrib\\" /etc/apt/sources.list
#done

# Add non-free section
#deb_lines="$(egrep '^(deb|deb-src) (http://deb.debian.org/debian/|http://security.debian.org/debian-security)' /etc/apt/sources.list | grep -Ev "non-free([[:space:]]|$)")"
#for l in $deb_lines; do
#	sed -i "s\\^$l$\\$l non-free\\" /etc/apt/sources.list
#done

# Add non-free-firmware section
#deb_lines="$(egrep '^(deb|deb-src) (http://deb.debian.org/debian/|http://security.debian.org/debian-security)' /etc/apt/sources.list | grep -Ev "non-free-firmware([[:space:]]|$)")"
#for l in $deb_lines; do
#	sed -i "s\\^$l$\\$l non-free-firmware\\" /etc/apt/sources.list
#done

cat << EOF > /etc/apt.sources.list
deb https://deb.debian.org/debian/ trixie contrib main non-free non-free-firmware
# deb-src https://deb.debian.org/debian/ trixie contrib main non-free non-free-firmware

deb https://deb.debian.org/debian/ trixie-updates contrib main non-free non-free-firmware
# deb-src https://deb.debian.org/debian/ trixie-updates contrib main non-free non-free-firmware

deb https://deb.debian.org/debian/ trixie-proposed-updates contrib main non-free non-free-firmware
# deb-src https://deb.debian.org/debian/ trixie-proposed-updates contrib main non-free non-free-firmware

deb https://deb.debian.org/debian/ trixie-backports contrib main non-free non-free-firmware
# deb-src https://deb.debian.org/debian/ trixie-backports contrib main non-free non-free-firmware

deb https://security.debian.org/debian-security/ trixie-security contrib main non-free non-free-firmware
# deb-src https://security.debian.org/debian-security/ trixie-security contrib main non-free non-free-firmware
EOF

### configure apt to install only necessary package.
### as root

cat << EOF > /etc/apt/apt.conf.d/99no-recommends
APT::Install-Recommends "false";
APT::AutoRemove::RecommendsImportant "false";
APT::AutoRemove::SuggestsImportant "false";
EOF

# Update and install packages
apt-get update

echo -e "\e[1mDone...\e[0m"

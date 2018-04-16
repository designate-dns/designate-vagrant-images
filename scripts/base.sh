#!/bin/bash
set -e
sleep 20

# Disable CDROM entries to prevent apt-get from prompting to insert a disk
sed -i "/^deb cdrom:/s/^/#/" /etc/apt/sources.list

apt-get -y update
apt-get -y upgrade
apt-get -y install curl wget sudo nano htop git tig
apt-get clean
#!/bin/bash
set -e

if ! id -u vagrant >/dev/null 2>&1; then
    # Vagrant user
    /usr/sbin/groupadd vagrant
    /usr/sbin/useradd vagrant -g vagrant -G sudo -d /home/vagrant -s /bin/bash --create-home
    echo "vagrant:vagrant" | chpasswd
    echo "root:vagrant" | chpasswd
fi

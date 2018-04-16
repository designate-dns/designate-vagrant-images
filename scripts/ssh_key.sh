#!/bin/bash
set -e

# Install vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

#fix stuff
sed -i '/UsePAM/aUseDNS no' /etc/ssh/sshd_config
sed -i '/env_reset/aDefaults        env_keep += "SSH_AUTH_SOCK"' /etc/sudoers;
#sed -i '/exit/i\/usr\/bin\/apt-get update' /etc/rc.local;

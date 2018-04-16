#!/bin/bash
set -e

# Create vagrant user
if $(grep -q 'vagrant' /etc/shadow); then
  echo "User created"
elif $(grep -q 'ubuntu' /etc/shadow); then
  echo 'vagrant user does not exist, renaming ubuntu user...'
  mv /home/ubuntu /home/vagrant
  usermod -l vagrant -d /home/vagrant ubuntu
  groupmod -n vagrant ubuntu
  echo -n 'vagrant:vagrant' | chpasswd
  echo 'Renamed ubuntu user to vagrant and changed password.'
else
  echo 'Creating vagrant user...'
  useradd --create-home -s /bin/bash vagrant
  adduser vagrant sudo &>> ${LOG}
  echo -n 'vagrant:vagrant' | chroot ${ROOTFS} chpasswd
fi
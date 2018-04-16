#!/bin/bash
set -e

# Set up sudo.  Be careful to set permission BEFORE copying file to sudoers.d
( cat <<'EOP'
%vagrant ALL=NOPASSWD:ALL
EOP
) > /tmp/vagrant
chmod 0440 /tmp/vagrant
mv /tmp/vagrant /etc/sudoers.d/
adduser vagrant adm
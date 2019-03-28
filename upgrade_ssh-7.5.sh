#!/bin/bash
# Copyright © 2019 Sivashankar
timestamp=$(date +%s)
mkdir openssh-7.5
cd openssh-7.5/
wget https://raw.githubusercontent.com/sivashankar4s/OpenSSH7.5-Install-script-centos/master/openssh-7.5p1-1.x86_64.rpm
wget https://raw.githubusercontent.com/sivashankar4s/OpenSSH7.5-Install-script-centos/master/openssh-debuginfo-7.5p1-1.x86_64.rpm
wget https://raw.githubusercontent.com/sivashankar4s/OpenSSH7.5-Install-script-centos/master/openssh-clients-7.5p1-1.x86_64.rpm
wget https://raw.githubusercontent.com/sivashankar4s/OpenSSH7.5-Install-script-centos/master/openssh-server-7.5p1-1.x86_64.rpm
cp /etc/pam.d/sshd pam-ssh-conf-$timestamp
cp /etc/ssh/sshd_config sshd_config-$timestamp
rpm -U *.rpm
yes | cp pam-ssh-conf-$timestamp /etc/pam.d/sshd
/etc/init.d/sshd restart

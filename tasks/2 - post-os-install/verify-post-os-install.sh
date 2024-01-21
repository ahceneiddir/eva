#!/bin/bash
#version 24.1.15

#mount
#lsblk -I 8 -d
#fdisk -l 
#df -kh
#lsblk

echo "***************************************************\n"
echo "/dev/sda5      ext4      196G  2.1G  184G   2% /"
echo "/dev/sda3      ext4      241G   16G  213G   7% /var"
echo "/dev/sda2      ext4      976M  166M  744M  19% /boot"
echo "/dev/sdb2      ext4       98G   61M   93G   1% /debug"
echo "/dev/sdb1      xfs       7.2T  417G  6.8T   6% /data"
#echo "/dev/loop0     iso9660    11G   11G     0 100% /mnt/iso"
echo "***************************************************\n"

df -Th | grep "^/dev"
while true; do
    read -p "Check disk Partition and Mount Point (type and Size) " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done

ssh root@165.122.135.39 'ssh -i /home/hammer/.ssh/id_rsa -o BatchMode=yes -o ConnectTimeout=5 hammer@65.230.197.21  "echo 2>&1" && echo SSH_OK || echo SSH_NOK'
while true; do
    read -p "Check Password less SSH Connection for hammer user from the controller this EVA ? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done
cat /etc/sysconfig/selinux | grep SELINUX=permissive
while true; do
    read -p "Is permissive set for SELINUX? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac	
done

lsblk -f && lsblk
while true; do
    read -p "Are partitions properly configured? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac	
done

ip route show
while true; do
    read -p "is network interface properly configured? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac	
done

systemctl status firewalld
while true; do 
    read -p "Is firewall disabled? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done

cat /etc/sudoers | grep wheel
while true; do
    read -p "Is file correct? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done
cat /etc/hosts
while true; do 
    read -p "Is file correct? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done
cat /etc/resolv.conf
while true; do 
    read -p "Is file correct? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done
hostname
hostname -f
hostname -i
while true; do 
    read -p "Are hostnames correct? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done
ls -ltr /etc/pki/tls/certs
while true; do
    read -p "Are permissions correct? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done
rpm -qa | grep wget
while true; do
    read -p "is the package present? " yn
    case $yn in
        [Yy]* ) verified; break;;
        [Nn]* ) echo "Please fix it"; exit;;
    esac
done

#Ask to clean the unwanted files root passwordless to the controller , remove the scriptetc ...

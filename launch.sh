#!/bin/bash
ssh-copy-id -i ~/.ssh/id_rsa.pub root@106.40.226.126
#ansible-playbook -l EVA tasks/post-os-install/root-ssh-copy-key.yml
#ansible-playbook -l EVA tasks/post-os-install/configure-etc-hosts-resolv.yml
#ansible-playbook -l EVA tasks/post-os-install/firewall.yml
#ansible-playbook -l EVA tasks/post-os-install/selinux-permissive.yml
#ansible-playbook -l EVA tasks/post-os-install/hammer-creation.yml --vault-id @prompt
#ansible-playbook -l EVA tasks/post-os-install/copy-files.yml
#ansible-playbook -l EVA tasks/post-os-install/reboot.yml


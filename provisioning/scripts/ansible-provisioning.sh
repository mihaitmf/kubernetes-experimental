#!/usr/bin/env bash

# Install Ansible
/vagrant/provisioning/scripts/install-ansible.sh

# Set working directory for future logins
grep -Pq 'cd /vagrant/provisioning/ansible' /home/vagrant/.bashrc || echo -e "\ncd /vagrant/provisioning/ansible\n" >> /home/vagrant/.bashrc

# Provision the rest of the machines defined in the "hosts" inventory file with Ansible
cd /vagrant/provisioning/ansible
ansible-playbook -i hosts playbook.yml

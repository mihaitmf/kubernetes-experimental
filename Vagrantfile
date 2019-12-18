# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 2.1'

VAGRANTFILE_API_VERSION = '2'
VM_IMAGE_NAME = 'ubuntu/bionic64'
WORKER_NODES_COUNT = 2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Install plugins if missing
  required_plugins = %w(vagrant-vbguest)
  plugins_to_install = required_plugins.select {|plugin| not Vagrant.has_plugin? plugin}
  if plugins_to_install.any?
    puts "Installing plugins: #{plugins_to_install.join(' ')}"
    if system "vagrant plugin install #{plugins_to_install.join(' ')}"
      exec "vagrant #{ARGV.join(' ')}"
    else
      abort 'Installation of one or more plugins has failed. Aborting.'
    end
  end

  # Set auto_update to false, if you do NOT want to check the correct virtual-box-guest-additions version when booting VM
  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  # Configure kube-master machine
  config.vm.define 'kube-master', primary: true do |kube_master_config|
    kube_master_config.vm.hostname = 'kube-master'
    kube_master_config.vm.network 'private_network', ip: '192.168.11.20'

    kube_master_config.vm.box = VM_IMAGE_NAME
    kube_master_config.vm.provider 'virtualbox' do |vb|
      vb.name = 'kube-master-VM'
      vb.cpus = 2
      vb.memory = 2048
    end

    kube_master_config.ssh.insert_key = false
    kube_master_config.vm.synced_folder '.', '/vagrant', disabled: true
    kube_master_config.vm.synced_folder './examples', '/examples', create: true

    # Enable password authentication, this is how Ansible will connect to the machine
    kube_master_config.vm.provision 'enable-ssh-password',
        name: 'Enable ssh password authentication for Ansible',
        type: 'shell',
        run: 'once',
        path: 'provisioning/scripts/enable-ssh-password-authentication.sh'
  end

  # Configure multiple kube-worker machines
  (1..WORKER_NODES_COUNT).each do |i|
    config.vm.define "kube-worker#{i}" do |kube_worker_config|
      kube_worker_config.vm.hostname = "kube-worker#{i}"
      kube_worker_config.vm.network 'private_network', ip: "192.168.11.#{i + 20}"

      kube_worker_config.vm.box = VM_IMAGE_NAME
      kube_worker_config.vm.provider 'virtualbox' do |vb|
        vb.name = "kube-worker#{i}-VM"
        vb.cpus = 2
        vb.memory = 2024
      end

      kube_worker_config.ssh.insert_key = false
      kube_worker_config.vm.synced_folder '.', '/vagrant', disabled: true

      # Enable password authentication, this is how Ansible will connect to the machine
      kube_worker_config.vm.provision 'enable-ssh-password',
          name: 'Enable ssh password authentication for Ansible',
          type: 'shell',
          run: 'once',
          path: 'provisioning/scripts/enable-ssh-password-authentication.sh'
    end
  end

  # Provision an extra machine with Ansible installed to run the playbooks
  config.vm.define 'kube-ansible' do |kube_ansible_config|
    kube_ansible_config.vm.hostname = 'kube-ansible'
    kube_ansible_config.vm.network 'private_network', ip: '192.168.11.9'

    kube_ansible_config.vm.box = VM_IMAGE_NAME
    kube_ansible_config.vm.provider 'virtualbox' do |vb|
      vb.name = 'kube-ansible-VM'
      vb.cpus = 1
      vb.memory = 512
    end

    kube_ansible_config.ssh.insert_key = false

    # Provision the rest of the machines using Ansible
    # !!! Note: very important to define ansible_user and ansible_ssh_pass in group_vars/all.yml
    kube_ansible_config.vm.provision 'ansible-provisioning',
        name: 'Provision all the machines with Ansible',
        type: 'shell',
        run: 'once',
        path: 'provisioning/scripts/ansible-provisioning.sh'
  end
end

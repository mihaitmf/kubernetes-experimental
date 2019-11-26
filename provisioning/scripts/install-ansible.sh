#!/usr/bin/env bash

apt update
apt install -y software-properties-common python3 sshpass
apt install -y python3-pip

pip3 install ansible

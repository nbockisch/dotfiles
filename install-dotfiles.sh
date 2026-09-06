#!/bin/bash

# Make sure the OS is supported and check if we need to install ansible
[[ "$OSTYPE" == "linux-gnu" ]] || ( echo "Error: This playbook currently only supports Linux" ; exit 1 )

[[ -f /etc/os-release ]] || ( echo "Error: Linux distribution couldn't be determined" ; exit 1 )

source /etc/os-release
if [[ "$ID" == "arch" ]]; then
    command -v ansible > /dev/null 2>&1 || pacman --noconfirm -S ansible
else
    echo "Error: OS not currently supported by this playbook"
    exit 1
fi

echo "OS is supported and Ansible is installed. Proceeding with the deployment..."

# Install the playbook dependencies and run the playbook
ansible-galaxy install -r requirements.yaml

ansible-playbook --ask-become-pass -i hosts.ini site.yaml

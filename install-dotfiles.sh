ansible-galaxy install -r requirements.yaml

ansible-playbook -i inventory/hosts.ini playbooks/dotfiles.yaml

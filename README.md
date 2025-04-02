# Dotfiles
These are my public dotfiles for my Arch linux setup, along with an Ansible playbook for deploying it.

## Requirements
* Fresh Arch Linux install
* Internet connection
* `ansible`
* `openssh` (running with permit root login enabled)
* `base-devel`

## Usage
* `git clone` the repository
* `cd` into it
* `ansible-galaxy install -r requirements.yaml`
* `ansible-playbook -i inventory.ini playbook.yaml`

## Credits
* Borrows **heavily** from [elifout's dotfiles](https://github.com/elifouts/Dotfiles)
* Uses `wofi-bluetooth` from [the rofi-bluetooth fork by arpn](https://github.com/arpn/wofi-bluetooth)

# Dotfiles

These are my personal dotfiles, currently a work in progress. I am configuring
all setup (including installation of dependencies) and deployment of these files
to be done through Ansible.

# Installation

My dotfiles are managed using [GNU Stow](https://www.gnu.org/software/stow/).
```
git clone https://github.com/nbockisch/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow <name of application or file, i.e. alacritty, .bashrc, etc.>
```

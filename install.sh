#!/usr/bin/env bash
# Ubuntu setup — follow along manually (see README), blocks are safe to re-run.

#
# base
sudo apt update
sudo apt install -y git stow curl fish gh

#
# mise (manages bun, node, gitui, bitwarden CLI — see mise/.config/config.toml)
curl -fsSL https://mise.run | sh
~/.local/bin/mise install

#
# tern terminal + omp agent (tern installs and keeps omp updated)
curl -fsSL https://tern.build/install.sh | sh

#
# bitwarden (app + SSH agent; fish config points SSH_AUTH_SOCK at it)
sudo snap install bitwarden
# MANUAL STEPs:
#   * log in and enable SSH Agent (Settings > Security)
#   * import your SSH keys into Bitwarden (they are served by the agent socket
#     wired in fish: SSH_AUTH_SOCK=~/snap/bitwarden/current/.bitwarden-ssh-agent.sock)
#   * vault must be UNLOCKED for the agent to serve keys (git signing + pushes)
#   * select the key you add to GitHub below

#
# zed
curl -f https://zed.dev/install.sh | sh

#
# ssh key
[ -f ~/.ssh/id_ed25519 ] || ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)"
cat ~/.ssh/id_ed25519.pub
# MANUAL STEPs:
#   * add the key on GitHub (https://github.com/settings/keys)
#   * run: gh auth login  (git credentials come from gh via .gitconfig)

#
# identity — NOT tracked, nothing sensitive lives in this repo
# MANUAL STEPs:
#   * create ~/.gitconfig.local:
#       [user]
#           name = Your Name
#           email = you@example.com
#           signingkey = <your public key: ssh-add -L>
#   * create ~/.ssh/allowed_signers: "<email> <same public key>"

#
# dotfiles
mkdir -p ~/Projects
git clone git@github.com:eduardomartines/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
./setup.sh
# MANUAL STEPs:
#   * ~/.ssh/config already exists? merge ssh/.ssh/config into it
#   * omp plugin state is not tracked (it churns and can hold plugin secrets);
#     restore the ponytail plugin:
#       omp plugin marketplace add DietrichGebert/ponytail
#       omp plugin install ponytail@ponytail
#   * existing machine (real config files, not links)? setup.sh --adopt takes them over

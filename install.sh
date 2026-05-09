#!/bin/bash

# Install dependencies
echo "Installing packages..."
sudo pacman -S --needed networkmanager wireplumber pacman-contrib libnotify dunst scrot xbindkeys zsh nvim kitty zathura yazi fastfetch

mkdir -p ~/.config/systemd/user
mkdir -p ~/.local/bin

# Create symlinks
echo "Linking files..."
ln -sf ~/my-dotfiles/.local/bin/* ~/.local/bin/
for file in .zshrc .zprofile .xinitrc .xbindkeysrc; do
    ln -sf ~/my-dotfiles/$file ~/$file
done
ln -sf ~/my-dotfiles/.config/zathura ~/.config/zathura
ln -sf ~/my-dotfiles/.config/yazi ~/.config/yazi
ln -sf ~/my-dotfiles/.config/kitty ~/.config/kitty
ln -sf ~/my-dotfiles/.config/dunst ~/.config/dunst
ln -sf ~/my-dotfiles/.config/fastfetch ~/.config/fastfetch
ln -sf ~/my-dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/my-dotfiles/.config/systemd/user/check-updates.service ~/.config/systemd/user/check-updates.service
ln -sf ~/my-dotfiles/.config/systemd/user/check-updates.timer ~/.config/systemd/user/check-updates.timer

# Start daemons
echo "Starting updates timer..."
systemctl --user daemon-reload
systemctl --user enable --now check-updates.timer

echo "Done!"

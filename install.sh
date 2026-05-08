#!/bin/bash

# Install dependencies
echo "Installing packages..."
sudo pacman -S --needed pacman-contrib libnotify dunst xbindkeys zsh nvim alacritty fastfetch

mkdir -p ~/.config/systemd/user

# Create symlinks
echo "Linking files..."
for file in .zshrc .zprofile .xinitrc .xbindkeysrc; do
    ln -sf ~/my-dotfiles/$file ~/$file
done
ln -sf ~/my-dotfiles/.config/alacritty ~/.config/alacritty
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

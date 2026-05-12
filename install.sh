#!/bin/bash

set -e

# Install dependencies
echo "Installing packages..."
sudo pacman -S --needed networkmanager wireplumber pacman-contrib libnotify dunst scrot xbindkeys zsh nvim kitty zathura yazi fastfetch

mkdir -p ~/.config/systemd/user
mkdir -p ~/.local/bin

# Create symlinks
echo "Linking files..."

for f in ~/my-dotfiles/.local/bin/*; do
    ln -sf "$f" ~/.local/bin/
done

for file in .zshrc .zprofile .xinitrc .xbindkeysrc; do
    ln -sf ~/my-dotfiles/$file ~/$file
done

for dir in yazi kitty zathura dunst fastfetch nvim; do
    target="$HOME/.config/$dir"
    source="$HOME/my-dotfiles/.config/$dir"

    rm -rf "$target"
    ln -s "$source" "$target"
done

ln -sfn ~/my-dotfiles/.config/systemd/user/check-updates.service ~/.config/systemd/user/check-updates.service
ln -sfn ~/my-dotfiles/.config/systemd/user/check-updates.timer ~/.config/systemd/user/check-updates.timer

# Start daemons
echo "Starting updates timer..."
systemctl --user daemon-reload
systemctl --user enable --now check-updates.timer

echo "Done!"

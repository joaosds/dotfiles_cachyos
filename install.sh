#!/bin/bash
# Fresh CachyOS install script
# Run this before restoring dotfiles

set -e

echo "==> Updating system..."
sudo pacman -Syu --noconfirm

echo "==> Installing paru (AUR helper)..."
if ! command -v paru &> /dev/null; then
  sudo pacman -S --noconfirm base-devel git
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  (cd /tmp/paru && makepkg -si --noconfirm)
fi

echo "==> Installing core tools..."
sudo pacman -S --noconfirm \
  neovim \
  tmux \
  fish \
  git \
  ripgrep \
  fd

echo "==> Installing Niri (Wayland compositor) dependencies..."
sudo pacman -S --noconfirm \
  niri \
  xdotool \
  wl-clipboard

echo "==> Installing LaTeX..."
sudo pacman -S --noconfirm \
  texlive \
  texlive-binextra

echo "==> Installing Zathura (PDF viewer with synctex)..."
sudo pacman -S --noconfirm \
  zathura \
  zathura-pdf-mupdf

echo "==> Installing Python tools..."
sudo pacman -S --noconfirm \
  python-pip \
  python-black \
  flake8 \
  python-pynvim

echo "==> Installing communication apps..."
sudo pacman -S --noconfirm \
  telegram-desktop \
  discord

echo "==> Installing Spotify (AUR)..."
paru -S --noconfirm spotify

echo "==> Setting fish as default shell..."
chsh -s /usr/bin/fish

echo ""
echo "Done! Now restore your dotfiles — see README.md for the next steps."

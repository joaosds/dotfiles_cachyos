# dotfiles_cachyos

Personal dotfiles for CachyOS. Includes configs for Neovim, Tmux, Fish, and Niri.

## Contents

| Config | Path |
|---|---|
| Neovim | `~/.config/nvim/` |
| Tmux | `~/.tmux.conf` |
| Fish | `~/.config/fish/` |
| Niri | `~/.config/niri/` |

## Fresh install

### 1. Install dependencies
```bash
bash install.sh
```

### 2. Clone the dotfiles
```bash
git clone --bare git@github.com:joaosds/dotfiles_cachyos.git ~/github/dotfiles
```

### 3. Set up the alias
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/github/dotfiles/ --work-tree=\$HOME'" >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
```

### 4. Restore the files
```bash
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

### 5. Install Neovim plugins
Open nvim — lazy.nvim will auto-install all plugins on first launch.

Then install LSP servers inside nvim:
```
:MasonUpdate
```

### 6. Install Tmux plugins
Inside a tmux session press `Ctrl+T` then `Shift+I`.

#!/usr/bin/env/zsh

# This is the setup script for my config. The idea is to be able to run
# this after cloning the repo on a Mac or Ubuntu (WSL) system and be up
# and running very quickly.

# create directories
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"/bash
mkdir -p "$XDG_CONFIG_HOME"/alacritty
mkdir -p "$XDG_CONFIG_HOME"/alacritty/themes

git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes

# Symbolic links
# ln -s ./.amethyst.yml "$HOME"/.amethyst.yml
ln -sf "$PWD/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml
ln -sf "$PWD/.bash_profile" "$HOME"/.bash_profile
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/.inputrc" "$HOME"/.inputrc
ln -sf "$PWD/.tmux.conf" "$HOME"/.tmux.conf
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim

# Packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask alacritty
brew install bat
brew install tree
brew install amethyst
brew install fzf
brew install nvim

# ubuntu packages apt
sudo apt update
sudo apt install ripgrep gh

# ubuntu apt neovim setup
sudo apt install gcc g++ unzip

# ubuntu brew for vim and neovim setup
sudo apt install fd-find fzf kubectl kubectx
sudo snap install k9s

# ubuntu brew for neovim setup
brew install neovim go lazygit

# Installing Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing Powerlevel10k for Oh-My-Zsh
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set ZSH theme to Powerlevel10k
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Copying configuration files for Oh-My-Zsh and Powerlevel10k
#cp ~/oh-my-zsh/* $ZSH_CUSTOM
cp $PWD/.p10k.zsh $HOME/.p10k.zsh

# Apply configurations and change default shell to zsh
source $HOME/.zshrc
chsh -s $(which zsh)

echo "Installation and configuration complete. Please restart your terminal or source ~/.zshrc"

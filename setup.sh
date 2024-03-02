#!/usr/bin/env zsh

# env variables
export XDG_CONFIG_HOME="$HOME"/.config
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# create directories
mkdir -p "$XDG_CONFIG_HOME"/bash
mkdir -p "$XDG_CONFIG_HOME"/alacritty
mkdir -p "$XDG_CONFIG_HOME"/alacritty/themes

# install alacritty theme
git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes

# Symbolic links
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

# ubuntu brew for neovim setup
brew install neovim lazygit

# Installing Oh-My-Zsh
rm -rf $HOME/.oh-my-zsh/
#(KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Installing Powerlevel10k for Oh-My-Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
cp $PWD/.p10k.zsh $HOME/.p10k.zsh

# zsh-syntax-highlighting and zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

#sed -i'.backup' '/^plugins=(/ s/)$/ zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Apply configurations and change default shell to zsh
source $HOME/.zshrc
chsh -s $(which zsh)

echo "Installation and configuration complete. Please restart your terminal or source ~/.zshrc"

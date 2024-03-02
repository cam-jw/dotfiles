#!/bin/bash

# Define environment variables
XDG_CONFIG_HOME="$HOME/.config"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
DOTFILES_DIR="$(pwd)" # Assuming current directory contains dotfiles

# Function to create necessary directories
create_directories() {
  mkdir -p "$XDG_CONFIG_HOME/bash"
  mkdir -p "$XDG_CONFIG_HOME/alacritty"
  mkdir -p "$XDG_CONFIG_HOME/alacritty/themes"
  mkdir -p "$XDG_CONFIG_HOME/nvim"
}

# Function to clone repositories
clone_repositories() {
  git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME/alacritty/themes"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
}

# Function to create symbolic links
create_symbolic_links() {
  ln -sf "$DOTFILES_DIR/alacritty.toml" "$XDG_CONFIG_HOME/alacritty/alacritty.toml"
  ln -sf "$DOTFILES_DIR/alacritty_gruvbox_dark.toml" "$XDG_CONFIG_HOME/alacritty/themes/gruvbox_dark.toml"
  ln -sf "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
  ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
  ln -sf "$DOTFILES_DIR/.inputrc" "$HOME/.inputrc"
  ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
  ln -sf "$DOTFILES_DIR/nvim" "$XDG_CONFIG_HOME/nvim"
  ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
  ln -sf "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
}

# Function to install packages on MacOS
install_macos_packages() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install --cask alacritty
  brew install bat tree fzf nvim node neovim lazygit
}

# Function to install packages on Ubuntu
install_ubuntu_packages() {
  sudo apt update
  sudo apt install -y ripgrep gh gcc g++ unzip fd-find fzf kubectl kubectx neovim
}

# Function to install Oh-My-Zsh
install_oh_my_zsh() {
  rm -rf "$HOME/.oh-my-zsh/"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

# Function to set default shell to zsh
set_default_shell() {
  chsh -s "$(which zsh)"
}

# Main function to orchestrate setup
main() {
  create_directories
  clone_repositories
  create_symbolic_links
  if [[ "$OSTYPE" == "darwin"* ]]; then
    install_macos_packages
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    install_ubuntu_packages
  fi
  install_oh_my_zsh
  set_default_shell
  printf "Installation and configuration complete. Please restart your terminal or source ~/.zshrc\n"
}

main "$@"


#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

# Set to superior editing mode
set -o vi

# keybinds
#bind -x '"\C-l":clear'
# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

# config
#export BROWSER="chrome"

# directories
#export DOTFILES="$GHREPOS/dotfiles"
#export SCRIPTS="$DOTFILES/scripts"

# Go related. In general all executables and scripts go in .local/bin
#export GOBIN="$HOME/.local/bin"
#export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
# export GOPATH="$HOME/.local/share/go"
#export GOPATH="$HOME/go/"

# dotnet
#export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~
# function from Arch Wiki, to prevent adding directories multiple times

# set_path(){
#
#     # Check if user id is 1000 or higher
#     [ "$(id -u)" -ge 1000 ] || return
#
#     for i in "$@";
#     do
#         # Check if the directory exists
#         [ -d "$i" ] || continue
#
#         # Check if it is not already in your $PATH.
#         echo "$PATH" | grep -Eq "(^|:)$i(:|$)" && continue
#
#         # Then append it to $PATH and export it
#         export PATH="${PATH}:$i"
#     done
# }
#
# set_path "$HOME"/git/lab/bash "$HOME"/.local/bin

# https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path
# PATH="${PATH:+${PATH}:}~/opt/bin"   # appending
# PATH="~/opt/bin${PATH:+:${PATH}}"   # prepending

# Commands also provided by macOS and the commands dir, dircolors, vdir have been installed with the prefix "g".
# If you need to use these commands with their normal names, you can add a "gnubin" directory to your PATH with:
#  PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

#PATH="${PATH:+${PATH}:}"$SCRIPTS":/opt/homebrew/opt/dotnet@6/bin:/opt/homebrew/opt/dotnet/bin:"$HOME"/.local/bin:"$HOME"/.dotnet/tools" # appending

#export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~

#export HISTFILE=~/.histfile
#export HISTSIZE=25000
#export SAVEHIST=25000
#export HISTCONTROL=ignorespace

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~

# This function is stolen from rwxrob

#clone() {
#	local repo="$1" user
#	local repo="${repo#https://github.com/}"
#	local repo="${repo#git@github.com:}"
#	if [[ $repo =~ / ]]; then
#		user="${repo%%/*}"
#	else
#		user="$GITUSER"
#		[[ -z "$user" ]] && user="$USER"
#	fi
#	local name="${repo##*/}"
#	local userd="$REPOS/github.com/$user"
#	local path="$userd/$name"
#	[[ -d "$path" ]] && cd "$path" && return
#	mkdir -p "$userd"
#	cd "$userd"
#	echo gh repo clone "$user/$name" -- --recurse-submodule
#	gh repo clone "$user/$name" -- --recurse-submodule
#	cd "$name"
#} && export -f clone

# ~~~~~~~~~~~~~~~ SSH ~~~~~~~~~~~~~~~~~~~~~~~~
# SSH Script from arch wiki

#if ! pgrep -u "$USER" ssh-agent >/dev/null; then
#	ssh-agent >"$XDG_RUNTIME_DIR/ssh-agent.env"
#fi
#if [[ ! "$SSH_AUTH_SOCK" ]]; then
#	source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
#fi

# Only run on Ubuntu

#if [[ $(grep -E "^(ID|NAME)=" /etc/os-release | grep -q "ubuntu")$? == 0 ]]; then
#	eval "$(ssh-agent -s)" >/dev/null
#fi

# adding keys was buggy, add them outside of the script for now
# ssh-add -q ~/.ssh/mischa
# ssh-add -q ~/.ssh/mburg
#{
#ssh-add -q ~/.ssh/id_ed25519
#ssh-add -q ~/.ssh/vanoord
#} &>/dev/null

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
## Explicitly unset color (default anyhow). Use 1 to set it.
#export GIT_PS1_SHOWCOLORHINTS=1
#export GIT_PS1_DESCRIBE_STYLE="branch"
# export GIT_PS1_SHOWUPSTREAM="auto git"

# if [[ -f "$XDG_CONFIG_HOME/bash/gitprompt.sh" ]]; then
# 	source "$XDG_CONFIG_HOME/bash/gitprompt.sh"
# fi

# PROMPT_COMMAND='__git_ps1 "\u@\h:\W" " \n$ "'
# colorized prompt
#PROMPT_COMMAND='__git_ps1 "\[\e[33m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\]:\[\e[35m\]\W\[\e[0m\]" " \n$ "'

# The __git_ps1 function prompt is provided by the bash completion installed by brew. See https://github.com/mischavandenburg/dotfiles/issues/5

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
alias v=nvim

# cd
alias docs='cd ~/Documents/'
alias ..="cd .."
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias dots='cd ~/Documents/test_dots/dotfiles'
alias cl="clear"

# storage
alias du='du -kh'  # file space
alias df='df -kTh' # disk space

# ls
alias l="ls -1"
alias ls='ls -CF --color=auto'
alias la='ls -Al'
alias lx='ls -lXB'
alias lk='ls -lSr'
alias lc='ls -ltcr'
alias tree='tree -Csu'

# files
alias rmd='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# tmux
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'
alias tkill='tmux kill-server'
alias e='exit'

# git
alias ga='git add'
alias gaa='git add .'
alias gcl='git clone'
alias gb='git branch'
alias gco='git checkout'
alias gcom='git checkout master'
alias gp='git pull'
alias gf='git fetch'
alias gs='git status'
alias gc='git commit -m'
alias grbm='git rebase master'
alias grbc='git rebase continue'
alias grba='git rebase abort'
alias grhead='git reset HEAD^'
alias grhard='git fetch origina && git reset --hard'
alias gst='git stash'
alias gstp='git statsh pop'
alias gstc='git stash clear'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias lg='lazygit'

# ricing
alias et='v ~/.config/awesome/themes/powerarrow/theme-personal.lua'
alias ett='v ~/.config/awesome/themes/powerarrow-dark/theme-personal.lua'
alias er='v ~/.config/awesome/rc.lua'
alias ez='v ~/.zshrc'
alias eb='v ~/.bashrc'
alias ev='cd ~/.config/nvim/ && v init.lua'
alias sz='source ~/.zshrc'
alias sb='source ~/.bashrc'
alias s='startx'

# fuzzy searching with fzf
alias fp="fzf --preview 'bat --style=plain --color=always --line-range :500 {}'"
# search for a file with fzf and open it in vim
alias vf='v $(fp)'

#pdf reading

alias pdf='zathura'
alias fpdf="find . -type f -iname '*.pdf' | fzf --preview 'pdftotext {} - | head -n 100'"
alias pdfp='zathura $(fpdf)'

# env variables
export VISUAL=nvim
export EDITOR=nvim

# brew bash completion
if [[ "$OSTYPE" == "darwin"* ]]; then
	[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
else
	[ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

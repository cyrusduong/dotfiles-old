# .zshrc config
#
# basic zsh/antigen, vim, golang, nvm, setup
#
if [[ -e "${HOME}/.zprofile" ]]; then
  source "${HOME}/.zprofile"
fi

# Grab antigen if we dont have it
if [[ ! -e $HOME/.antigen/antigen.zsh ]]; then
  git clone https://github.com/zsh-users/antigen.git ~/.antigen
fi

# source antigen now
source $HOME/.antigen/antigen.zsh

# grab our aliases if they exist
if [[ -e "${HOME}/.aliases" ]]; then
  source "${HOME}/.aliases"
fi


if [[ -e "${HOME}/.scripts.sh" ]]; then
  source "${HOME}/.scripts.sh"
fi


if [[ -e "${HOME}/.exports" ]]; then
  source "${HOME}/.exports"
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle vundle
antigen bundle wd

# highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# kubernetes
antigen bundle kubectl
antigen bundle ahmetb/kubectx

# always been getting more efficient
antigen bundle djui/alias-tips

#lock screen, we bind to this in our i3 keybindings
antigen bundle guimeira/i3lock-fancy-multimonitor

#load up teiler for imagie / screencasting
# todo ::
antigen bundle carnage/teiler

#our zsh theme, a popular powerline variant
antigen theme agnoster

#override ctrl to use peco for fuzzy searching of history
antigen bundle jimeh/zsh-peco-history

# Tell antigen that you're done.
antigen apply

# stern completion
source <(stern --completion=zsh)
# work variables
source ~/.intellifarms

# function to install deb packages
installdeb() {
    sudo dpkg -i "$1"
    sudo apt-get install -f
}

eval `keychain --eval --agents ssh id_rsa`

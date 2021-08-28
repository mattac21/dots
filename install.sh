#!/bin/bash
function install_packages () {
    if [ "$INSTALL_PACKAGES_AS_ROOT" = true ]; then
        echo "Installing: ${1} as root!"
        sudo $PACKAGE_MANAGER install ${1}
    else
        echo "Installing: ${1}!"
        $PACKAGE_MANAGER install ${1}
    fi
}

THIS_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# get the package manager
if [ -n "$1" ]; then
    PACKAGE_MANAGER=$1
    echo "Package manager set to $PACKAGE_MANAGER."
else
    echo "Usage: sudo ./install PACKAGE_MANAGER"
    exit 1
fi

# if package manager should be run as root (defaults to true)
# this is here to add support for homebrew which no longer supports being
# run as root
INSTALL_PACKAGES_AS_ROOT=true
if [ -n "$2" ]; then
    INSTALL_PACKAGES_AS_ROOT=$2
fi

# some essential packages to get started
PACKAGES="git make gcc wget curl tmux zsh vim llvm ruby"
install_packages "$PACKAGES"

# oh my zsh!
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "plugins=( [plugins...] zsh-syntax-highlighting)" >> $HOME/.zshrc



# change shell to zsh
chsh -s $(which zsh)

# detect os
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
esac

# install go (only supporting linux here)
if [[ "$machine" == "Linux" ]]; then
    wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.zshrc

    rm go1.17.linux-amd64.tar.gz
    source $HOME/.zshrc
fi

echo "Setup complete!"


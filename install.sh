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
PACKAGES="git make gcc wget curl tmux zsh"
install_packages "$PACKAGES"

# oh my zsh!
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# change shell to zsh
chsh -s $(which zsh)

# not installing neovim because it is too os specific, you should
# install the nightly version of neovim on your own. 
#
# https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-package
#
# neovim expects config files at $HOME/.config/nvim so we create a symlink
# for convenience
ln -f -s $THIS_SCRIPT_PATH/neovim $HOME/.config/nvim






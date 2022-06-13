#!/bin/bash

# install neovim nightly and other distro specific packages
if [[ "$1" == "ubuntu" ]]; then
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
    sudo snap install node
elif [[ "$1" == "fedora" ]]; then
    sudo dnf copr enable agriffis/neovim-nightly
    sudo dnf install -y neovim python3-neovim gcc-c++ libstdc++-static nodejs flex bison elfutils-libelf-devel openssl-devel dwarves zstd
elif [[ "$1" == "osx" ]]; then
    brew install --HEAD neovim
else
    echo "Distro $1 not supported" echo -e "Usage:"
    echo -e "\t./install-nvim DISTRO"
    echo -e "\tSupported Distros: ubuntu, fedra, osx"
    exit 1
fi


# install all plugins using plugged plugin manager
# init.vim file will handle auto install of plugin manager
nvim -c "PlugInstall --sync" -c "PlugUpdate --sync" -c "qall"  

# neovim expects config files at $HOME/.config/nvim so we create a symlink
# for convenience
mkdir -p $HOME/.config/
ln -f -s $THIS_SCRIPT_PATH/neovim $HOME/.config/nvim

# install language servers 
GO111MODULE=on go install golang.org/x/tools/gopls@latest
sudo npm install -g pyright bash-language-server vscode-langservers-extracted dockerfile-language-server-nodejs typescript typescript-language-server
gem install --user-install solargraph








#!/bin/bash

APPDIR=`pwd`
rm -rf ~/.vim



# VIM SETUP
printf "\n\nSetting up vim"
printf "\nInstalling pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
#emmet-vim
printf "\n\nInstalling emmet\n"
git clone https://github.com/mattn/emmet-vim.git
#nerdtree
printf "\nInstalling nerdtree\n"
git clone https://github.com/scrooloose/nerdtree.git

#tcomment_vim
printf "\nInstalling tcomment\n"
git clone https://github.com/tomtom/tcomment_vim.git

#vim-blade
printf "\nInstalling vim-blade\n"
git clone https://github.com/xsbeats/vim-blade.git

#vim-colors-solarized
printf "\nInstalling vim-colors-solarized\n"
git clone https://github.com/altercation/vim-colors-solarized.git

printf "\nInstalling vimrc\n"
cp $APPDIR/.vimrc ~/.vimrc

#check for powerline, and if so add snippet to  
if [ -z ${POWERLINE_COMMAND+x} ]; then
    echo "powerline isnt installed"
else
    #let's get the location of powerline
    location=$(pip show powerline-status | sed -n '4p' | sed 's/Location: //')
    echo "source ${location}/powerline/bindings/vim/plugin/powerline.vim" >> ~/.vimrc
fi
printf "\nVim setup complete"

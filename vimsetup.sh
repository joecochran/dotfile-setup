#!/bin/bash

printf "Creating autoload and bundle directories, installing pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
$DIR = pwd
#emmet-vim
printf "\n\nInstalling emmet"
git clone https://github.com/mattn/emmet-vim.git

#nerdtree
printf "\nInstalling nerdtree"
git clone https://github.com/scrooloose/nerdtree.git

#tcomment_vim
printf "\nInstalling tcomment"
git clone https://github.com/tomtom/tcomment_vim.git

#vim-blade
printf "\nInstalling vim-blade"
git clone https://github.com/xsbeats/vim-blade.git

#vim-colors-solarized
printf "\nInstalling vim-colors-solarized"
git clone https://github.com/altercation/vim-colors-solarized.git

printf "\n\nAll Done!\n"

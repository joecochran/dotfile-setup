#!/bin/bash

#this is a comment, hello.

#store installer directory for later
APPDIR=`pwd`
#if [ -z ${POWERLINE_COMMAND+x} ]; then
#    echo "\npowerline is not installed, powerline will be skipped on all applications."
#else
    location=$(pip3 show powerline-status | sed -n '10p' | sed 's/Location: //')
#fi

#ZSH SETUP
app=zsh
if ! type "$app" > /dev/null 2>&1; then
    echo -e "\ncommand $app is not installed, skipping."
else
    if [ -d ~/oh-my-zsh ]; then
        rm -rf ~/.oh-my-zsh
    fi
    printf "\nSetting up $app"
    curl -L http://install.ohmyz.sh | sh
    echo -e "\nCustomizing TERM"
    echo -e "\nexport TERM=xterm-256color" >> ~/.zshrc
    echo -e "\nAdding aliases"
    echo -e "\n#Aliases\n$(cat $APPDIR/zsh/aliases.zsh)" >> ~/.zshrc

#    if [ -z ${POWERLINE_COMMAND+x} ]; then
#        echo "skipping powerline setup for $app"
#    else
        echo -e "Adding Powerline to $app"
        echo -e "\n#Powerline\n. ${location}/powerline/bindings/zsh/powerline.zsh" >> ~/.zshrc
#    fi
fi

#TMUX SETUP
pip3 install psutil
app=tmux
if ! type "$app" > /dev/null 2>&1; then
    echo -e "\ncommand $app is not installed, skipping."
else
    echo -e "\nSetting up $app"
    cp $APPDIR/tmux.conf ~/.tmux.conf
#    if [ -z ${POWERLINE_COMMAND+x} ]; then
#        echo -e "skipping powerline setup for $app"
#    else
        echo -e "Adding Powerline to $app"
        echo -e "run-shell \"powerline-daemon -q\"" >> ~/.tmux.conf
        echo -e "source ${location}/powerline/bindings/tmux/powerline.conf" >> ~/.tmux.conf
#    fi
    echo -e "\n$app setup complete"
fi

# VIM SETUP
app=vim
if ! type "$app" > /dev/null 2>&1; then
    echo -e "\ncommand $app is not installed, skipping."
else
    if [ -d ~/.vim ]; then
        rm -rf ~/.vim #remove existing .vim directory so install is fresh
    fi
    echo -e "\nSetting up $app"
    echo -e "\nInstalling pathogen"
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    cd ~/.vim/bundle
    #maybe this should be a config file I parse to install everything to?
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

    #ctrlp
    printf "\nInstalling ctrlp\n"
    git clone https://github.com/ctrlpvim/ctrlp.vim.git

    #install vimrc
    printf "\nInstalling vimrc\n"
    cp $APPDIR/vimrc ~/.vimrc
    #check for powerline, and if so add snippet to vimrc
 #   if [ -z ${POWERLINE_COMMAND+x} ]; then
 #       echo "skipping powerline setup for $app"
 #   else
        #let's get the location of powerline
        echo -e "Adding Powerline to $app"
        echo "source ${location}/powerline/bindings/vim/plugin/powerline.vim" >> ~/.vimrc
 #   fi
    printf "\n$app setup complete"
fi

printf "\n\nDotfiles installed successfully"

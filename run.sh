#!/bin/sh

# /home/username/
config_item=(
    # Directories
    ".config/alacritty"
    ".config/feh"
    ".config/nvim"
    ".config/sway"
    ".config/tmux"
    ".config/waybar"
    ".config/wofi"
    # Files
    ".bashrc"
)

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

home_dir=$script_dir/home

if [ "$1" == "backup" ]; then
    # clean up
    echo " Cleaning up backup directories."
    rm -rf $home_dir/

    # mark directory
    echo " Making backup directories."
    mkdir -p $home_dir/.config

    # backup
    echo " Backing up dotfiles."
    for item in ${config_item[@]}; do
        cp -r $HOME/$item $home_dir/$item
    done

elif [ "$1" == "restore" ]; then
    # clean up
    echo " Cleaning up dotfiles in the home directory."
    for item in ${config_item[@]}; do
        rm -rf $HOME/$item
    done
    
    # restore
    echo " Restoring dotfiles."
    for item in ${config_item[@]}; do
        cp -r $home_dir/$item $HOME/.config
    done
    mv $HOME/.config/.bashrc $HOME
fi

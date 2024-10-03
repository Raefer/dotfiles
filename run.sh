#!/bin/sh

target_item=(
    # Folders
    ".config/feh"
    ".config/sway"
    ".config/waybar"
    ".config/wofi"
    ## Reconfigured
    ".config/alacritty"
    ".config/nvim"
    ".config/tmux"

    # Files
    ".bashrc"
)

target_firefox=(
    "bookmarkbackups"
    "prefs.js"
)

# Get absolute path to this directory
script_loc=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
bak_home=$script_loc/home

# Mark backup directory
bak_config=$bak_home/.config
bak_firefox=$bak_home/.mozilla/firefox/xxxxxxxx.default-release

mkdir -p $bak_home $bak_config $bak_firefox

# Backing up
if [ "$1" == "bak" ]; then
    # Clean up 
    echo " Clean up and reset the backup folder."
    rm -r $bak_config/*
    rm -r $bak_firefox/*

    # Backup items
    echo " Backing up dotfiles."
    for item in ${target_item[@]}; do
        cp -r $HOME/$item $bak_home/$item
    done

    # Backup firefox
    echo " Backing up firefox."
    for item in ${target_firefox[@]}; do
        cp -r $HOME/.mozilla/firefox/*.default-release/$item $bak_firefox/$item
    done

    echo " Done."
fi


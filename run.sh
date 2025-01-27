#!/bin/bash

# /home/username/
config_item=(
    ".config/alacritty"
    ".config/feh"
    ".config/nvim"
    ".config/sway"
    ".config/tmux"
    ".config/waybar"
    ".config/wofi"
)

firefox_item=(
    ".mozilla/firefox/"*.default*/"places.sqlite"
    ".mozilla/firefox/"*.default*/"prefs.js"
)

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
bak_root=$script_dir/home

config_bak_loc=$bak_root/.config
firefox_bak_loc=$bak_root/.mozilla/firefox/xxxxxxxx.default-release
nixos_bak_loc=$bak_root/nixos

if [ "$1" == "backup" ]; then
    # clean up
    echo " Cleaning up backup directories."
    rm -rf "$bak_root"

    # mark directories
    echo " Making backup directories."
    mkdir -p "$config_bak_loc"
    mkdir -p "$firefox_bak_loc"
    mkdir -p "$nixos_bak_loc"

    # backup dotfiels
    echo " Backing up dotfiles."
    for item in "${config_item[@]}"; do
        cp -r "$HOME/$item" "$config_bak_loc/"
    done

    # backup firefox
    echo " Backing up firefox."
    for item in "${firefox_item[@]}"; do
        cp -r $HOME/$item "$firefox_bak_loc/"
    done

    # backup nixos
    echo " Backing up NixOS."
    cp -r "$HOME/nixos/"* "$nixos_bak_loc/"

elif [ "$1" == "restore" ]; then
    # clean up
    echo " Cleaning up dotfiles in the home directory."
    for item in "${config_item[@]}"; do
        rm -rf "$HOME/$item"
    done
    
    # restore dotfiles
    echo " Restoring dotfiles."
    for item in "${config_item[@]}"; do
        cp -r "$bak_root/$item" "$HOME/$item"
    done
    
    echo " Restoring firefox."
    for item in "${firefox_item[@]}"; do
        cp -r "$bak_root/$item" "$HOME/$item"
    done
fi

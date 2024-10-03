#!/bin/sh

# /
root_item=(
    "etc/xdg/reflector/reflector.conf"
)

# /home/username/
home_item=(
    # Folders
    ".config/alacritty"
    ".config/feh" # reconfiguration pending
    ".config/nvim"
    ".config/sway"
    ".config/tmux"
    ".config/waybar" # reconfiguration pending
    ".config/wofi" # reconfiguration pending
    # Files
    ".bashrc"
    # Inactive
)

# /home/username/.mozilla/firefox/xxxxxxxx.default-release/
firefox_item=( 
    "bookmarkbackups"
    "prefs.js"
)

# Get absolute path to this directory
script_location=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

root=$script_location/root
home=$root/home/xxxxxxxx
fire=$home/.mozilla/firefox/xxxxxxxx.default-release

conf=$home/.config

# Backing up
if [ "$1" == "bak" ]; then
    # Clean up 
    echo " Clean up and reset the backup folder."
    rm -r -v $root

    # Mark backup directory
    mkdir -p -v $root $home $fire $conf

    # Backup etc files
    echo " Backing up etc."
    for item in ${root_item[@]}; do
        cp -r -v /$item $root/$item
    done

    # Backup items
    echo " Backing up dotfiles."
    for item in ${home_item[@]}; do
        cp -r -v $HOME/$item $home/$item
    done

    # Backup firefox
    echo " Backing up firefox."
    for item in ${firefox_item[@]}; do
        cp -r -v $HOME/.mozilla/firefox/*.default-release/$item $fire/$item
    done

    echo " Done."
fi


#!/bin/sh

# /
root_item=(
    "etc/xdg/reflector/reflector.conf"
)

# /home/username/
home_item=(
    # Folders
    ".config/alacritty"
    ".config/feh"
    ".config/nvim"
    ".config/sway"
    ".config/tmux"
    ".config/waybar"
    ".config/wofi"
    # Files
    ".bashrc"
    # Inactive
)

# /home/username/.mozilla/firefox/xxxxxxxx.default-release/
firefox_item=( 
    "bookmarkbackups"
    "prefs.js"
)

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

home_dir=$script_dir/home
fire_dir=$script_dir/home/.mozilla/firefox/xxxxxxxx.default-release
root_dir=$script_dir/root

if [ "$1" == "bak" ]; then
    # clean up
    echo " Cleaning up backup directories."
    rm -r $home_dir/ $root_dir/

    # mark directory
    echo " Making backup directories."
    mkdir -p $fire_dir $root_dir $home_dir/.config
    mkdir -p $root_dir/etc/xdg/reflector

    # backup
    echo " Backing up dotfiles."
    for item in ${home_item[@]}; do
        cp -r $HOME/$item $home_dir/$item
    done

    echo " Backing up firefox config files."
    for item in ${firefox_item[@]}; do
        cp -r $HOME/.mozilla/firefox/*.default-release/$item $fire_dir/$item
    done

    echo " Backing up config files from root."
    for item in ${root_item[@]}; do
        cp -r /$item $root_dir/$item
    done
fi


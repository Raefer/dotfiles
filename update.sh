#!/bin/sh

DIR_PATH=".config/"
CONFIG_DIR=(
    "alacritty"
    "feh"
    "nvim"
    "sway"
    "tmux"
    "waybar"
    "wofi"
)

CONFIG_FILE=(
    ".bashrc"
)

mkdir .config

case "$1" in
    "backup") 
        for DIR in ${CONFIG_DIR[@]}; do 
            LOC=$DIR_PATH$DIR

            echo "> Deleting $DIR (./$LOC) in the backup directory"
            rm -rf ./$LOC

            echo "> Copying $DIR (~/$LOC) to the backup directory"
            cp -r ~/$LOC ./$DIR_PATH
        done

        for FILE in ${CONFIG_FILE[@]}; do 
            echo "> Deleting file ./$FILE in the backup directory"
            rm -f ./$FILE

            echo "> Copying file ./$FILE to the backup directory"
            mkdir -p $FILE
            rmdir $FILE
            cp -r ~/$FILE ./$FILE
        done
        ;;
    "restore_confirmed")
        for DIR in ${CONFIG_DIR[@]}; do 
            LOC=$DIR_PATH$DIR

            echo "> Deleting $DIR (~/$LOC) in the \$HOME directory"
            rm -rf ~/$LOC

            echo "> Copying $DIR (./$LOC) to the \$HOME directory"
            cp -r ./$LOC ~/$DIR_PATH
        done

        for FILE in ${CONFIG_FILE[@]}; do 
            echo "> Deleting file ./$FILE in the \$HOME directory"
            rm -f ~/$FILE

            echo "> Copying file ./$FILE to the \$HOME directory"
            mkdir -p ~/$FILE
            rmdir ~/$FILE
            cp -r ./$FILE ~/$FILE
        done
        ;;
    *)
        echo Error : Invalid argument or no argument provided.
        ;;
esac

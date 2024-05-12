#!/bin/sh

DIR_PATH=".config/"
CONFIG_DIR=(
    "tmux"
    "nvim"
    "alacritty"
    "waybar"
    "wofi"
    "sway"
)

CONFIG_FILE=(
    ".bashrc"
)

mkdir .config

case "$1" in
    backup) 
        for DIR in ${CONFIG_DIR[@]}; do 
            LOC=$DIR_PATH$DIR

            echo "> Deleting $DIR (./$LOC)"
            rm -rf ./$LOC

            echo "> Copying $DIR (~/$LOC)"
            cp -r ~/$LOC ./$DIR_PATH
        done

        for FILE in ${CONFIG_FILE[@]}; do 
            echo "> Deleting file ./$FILE"
            rm -f ./$FILE

            echo "> Copying file ./$FILE"
            mkdir -p $FILE
            rmdir $FILE
            cp -r ~/$FILE ./$FILE
        done
        ;;
    restore)
        for DIR in ${CONFIG_DIR[@]}; do 
            LOC=$DIR_PATH$DIR

            echo "> Deleting $DIR (./$LOC)"
            rm -rf ~/$LOC

            echo "> Copying $DIR (~/$LOC)"
            cp -r ./$LOC ~/$DIR_PATH
        done

        for FILE in ${CONFIG_FILE[@]}; do 
            echo "> Deleting file ./$FILE"
            rm -f ~/$FILE

            echo "> Copying file ./$FILE"
            mkdir -p ~/$FILE
            rmdir ~/$FILE
            cp -r ./$FILE ~/$FILE
        done
        ;;
    *)
        echo Error : Invalid argument or no argument provided.
        ;;
esac

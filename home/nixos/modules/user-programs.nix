{ config, pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
        # Replacement
        eza		# replacement for ls
        bat 	# replacement for cat
        # TUI
        feh		# image viewer
        htop	# process monitor
        hyfetch	# system info fetching utility
        ncdu	# disk usage analyser
        pavucontrol # volume control
        # GUI
        alacritty	# terminal emulator
        darktable	# non-destructive photo editor
        gnucash	# accounting
        libreoffice # office suite
        pcmanfm     # file manager
        telegram-desktop	# telegram
        vlc		# media player
    ];

    programs.firefox = {
        enable = true;
    };
}

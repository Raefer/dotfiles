{ config, pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
        neovim 	# editor
        tmux	# terminal multiplexer
        gcc		# c/c++ compiler
        gh 		# github cli tool
        git		# version control
        gnumake	# make tool
        # LSPs
        bash-language-server
    ];

    programs.neovim = {
        defaultEditor = true;
    };
}

{ config, pkgs, lib, ... }:
{
    imports = [
        ./compositor.nix
        ./development.nix
        ./language.nix
        ./shell.nix
        ./user-programs.nix
    ];
}

{ config, pkgs, ... }:

{
  imports = [
    ./bat
    ./fzf
    ./most
    /* ./rofi */
    /* ./networkmanager-dmenu */
    ./zsh
  ];
}

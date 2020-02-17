{ config, pkgs, ... }:

{
  imports = [
    ./bat
    ./most
    ./fzf
    /* ./rofi */
    /* ./networkmanager-dmenu */
    ./zsh
  ];
}

{ config, pkgs, ... }:

{
  imports = [
    ./udiskie
    ./sxhkd       # hotkeys
    ./picom
    /* ./background */
  ];
}

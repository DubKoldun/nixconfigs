{ config, pkgs, ... }:

{
  imports = [
    ./udiskie
    ./sxhkd       # hotkeys
    /* ./dunst */
    ./compton
    /* ./polybar */
    /* ./i3lock-fancy */
    ./background
  ];
}

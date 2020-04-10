{ config, pkgs, ... }:

{
  imports = [
    ./udiskie
    /* ./sxhkd       # hotkeys */
    ./picom
    ./power-manager
    /* ./adb */
    /* ./background */
  ];
}

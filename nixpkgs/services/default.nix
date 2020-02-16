{ config, pkgs, ... }:

{
  imports = [
    ./udiskie
    ./sxhkd       # hotkeys
  ];
}

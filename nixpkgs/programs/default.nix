{ config, pkgs, ... }:

{
  imports = [
    ./bat
    ./most
    ./fzf
    ./zsh
  ];
}

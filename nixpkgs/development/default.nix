{ config, pkgs, ... }:

{
  imports = [
    ./vscode
    # ./jetbrains
    ./programming-languages
  ];
}

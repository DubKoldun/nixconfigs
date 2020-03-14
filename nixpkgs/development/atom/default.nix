{ config, pkgs, ... }:

{
  home.packages = [ pkgs.atom ];
  home.file.".atom/config.cson".source = ./config.cson;
}

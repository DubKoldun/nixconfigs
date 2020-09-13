{ config, pkgs, lib, ... }:

let sources = import ./nix/sources.nix;
in {
  imports = [ ./nixos/configuration.nix "${sources.home-manager}/nixos" ];

  nixpkgs.config.allowUnfree = true;

  i18n.defaultLocale = "en_US.UTF-8";

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
  };
}

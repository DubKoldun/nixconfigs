{ config, pkgs, ... }:

let theme = import ../theme { inherit pkgs; };
in {
  imports = [ ./mime.nix ];
  /* xsession.enable = true; */
  xresources.extraConfig = theme.xresources;
}

{ lib, pkgs, ... }:

let theme = import ./theme { inherit pkgs; };
in {
  imports = [ ./packages /*./xsession*/ ./services ./programs ./development ];

  home = {
    sessionVariables = {
      PATH = "$HOME/.yarn/bin/:$PATH";
      EDITOR = "atom";
      PAGER = "most";
      USE_NIX2_COMMAND = 1;
    };

    keyboard = {
      layout = "us,ru";
      # options = [ "grp:caps_toggle" ];
      # "grp:ctrl_alt_toggle"
    };
  };

  gtk = {
    enable = true;
    iconTheme = theme.icons;
    theme = theme.gtk;
    font = theme.fonts.gtk;
  };

  programs = {
    home-manager = {
      enable = true;
      /* path = "https://github.com/rycee/home-manager/archive/release-19.09.tar.gz"; */
      path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
    };
  };

  fonts.fontconfig.enable = true;
}

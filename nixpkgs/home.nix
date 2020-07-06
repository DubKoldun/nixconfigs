{ lib, pkgs, ... }:

let theme = import ./theme { inherit pkgs lib; };
in {
  imports = [ ./packages /*./xsession*/ ./services ./programs ./development ];

  home = {
    sessionVariables = {
      PATH = "$HOME/.yarn/bin/:$PATH";
      EDITOR = "code";
      PAGER = "most";
      USE_NIX2_COMMAND = 1;
      XDG_CURRENT_DESKTOP = "Gnome"; # telegram shitty file-piker fix
    };

    keyboard = {
      layout = "us,ru";
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
      /* path = "https://github.com/rycee/home-manager/archive/release-20.03.tar.gz"; */
      path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
    };
  };
  fonts.fontconfig.enable = true;
}

{ lib, pkgs, ... }:

let theme = import ./theme { inherit pkgs lib; };
in {
  imports = [ ./packages ./services ./programs ./development ./window-manager];

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

  nixpkgs = {
    config.allowUnfree = true;

  };

  gtk = {
    enable = false; # kde kekw
    iconTheme = theme.icons;
    theme = theme.gtk;
    font = theme.fonts.gtk;
    # gtk2.extraConfig = 
    #   ''gtk-enable-animations=1
    #   gtk-primary-button-warps-slider=0
    #   gtk-theme-name="Breeze"
    #   gtk-icon-theme-name="breeze"
    #   gtk-fallback-icon-theme="hicolor"
    #   gtk-cursor-theme-name="breeze_cursors"
    #   gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
    #   gtk-menu-images=1
    #   gtk-button-images=1
    #   '';

    
  };

  programs = {
    home-manager = {
      enable = true;
      /* path = "https://github.com/rycee/home-manager/archive/release-19.09.tar.gz"; */
      # path = "https://github.com/rycee/home-manager/archive/release-20.09.tar.gz";
      path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
    };
    # newsboat.browser.default = "";
  };
  # fonts.fontconfig.enable = true;
}

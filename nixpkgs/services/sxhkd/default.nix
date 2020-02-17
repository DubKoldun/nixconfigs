{ pkgs, ... } :

{
  services.sxhkd = {
    enable = true;
    /* ex */

    keybindings = {
      /* "space + t" = "xcfe4-terminal"; */
      /* "super + d" = "home"; */
    };
  };
}

{ pkgs, ... } :

{
  services.sxhkd = {
    enable = true;
    /* extraPath = "${pkgs.gnome3.gnome-terminal}/bin:/home/vutaliy/.yarn/bin/:/home/vutaliy/bin:/run/wrappers/bin:/home/vutaliy/.nix-profile/bin:/etc/profiles/per-user/vutaliy/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/home/vutaliy/.zsh/plugins/you-should-use:/home/vutaliy/.zsh/plugins/fast-syntax-highlighting"; */

    keybindings = {
      /* "ctrl + alt" = "gnome-terminal"; */
      /* "super + d" = "home"; */
    };
  };
}

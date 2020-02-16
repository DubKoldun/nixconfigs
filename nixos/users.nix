{ config, pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    users.vutaliy = {
      createHome = true;
      isNormalUser = true;
      extraGroups =
        [ "wheel" "networkmanager" "audio" "video" "input" ];
      description = "Vitalya loh";
    };
  };
}

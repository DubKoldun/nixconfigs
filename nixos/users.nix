{ config, pkgs, ... }:

let username = "vutaliy";
in {
  users = {
    defaultUserShell = pkgs.zsh;
    users."${username}" = {
      createHome = true;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
      description = "Ma boy";

      # TODO temporary to check build
      hashedPassword =
        "$6$90sWr84wO2$dD5YjotjN9o5s0ou5E82R.4OQIrTMwUQt7XcsWqShH0OOZER4CHyA4QJUJTyFSkTXjzpKklDsRfpvimvdxqz1/";
    };
  };

  home-manager.users."${username}" = args:
    import ../nixpkgs/home.nix (args // { inherit pkgs; });

  systemd.services."home-manager-${username}".preStart = ''
    ${pkgs.nix}/bin/nix-env -i -E
  '';
}

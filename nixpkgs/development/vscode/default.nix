{ config, lib, pkgs, autoPatchelfHook, ... }:


{
  programs.vscode = {
      enable = true;
      userSettings = {
        "omnisharp.enableRoslynAnalyzers" = true;
        "omnisharp.path" = "/home/vutaliy/.nix-profile/bin/omnisharp";
      };

  };

}

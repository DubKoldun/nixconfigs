{ config, lib, pkgs, autoPatchelfHook, ... }:


{
  programs.vscode = {
      enable = true;
      userSettings = {
            "omnisharp.enableRoslynAnalyzers" = true;
            "omnisharp.path" = "/home/vutaliy/.nix-profile/bin/omnisharp";
            "workbench.colorTheme" = "Monokai Dimmed";
            "window.zoomLevel" = 0;
            "explorer.confirmDelete" = false;
            "extensions.ignoreRecommendations" = false;
            "markdown.preview.scrollPreviewWithEditor" = false;
            
      };

  };

}

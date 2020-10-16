 { config, pkgs, ... }:

with config.lib; {
 
 userSettings = {
            "omnisharp.enableRoslynAnalyzers" = true;
            "omnisharp.path" = "/home/vutaliy/.nix-profile/bin/omnisharp";
            "workbench.colorTheme" = "Monokai Dimmed";
            "window.zoomLevel" = 0;
            "explorer.confirmDelete" = false;
            "extensions.ignoreRecommendations" = false;
            "markdown.preview.scrollEditorWithPreview" = false;
            "debug.javascript.usePreview" = true;
            "gitmoji.outputType" = "code";
            "editor.tabSize" = 2;
            "github.gitAuthentication" = false;
      };

      "ghcSimple.startupCommands.all" = [
        "System.IO.hSetBuffering System.IO.stderr System.IO.NoBuffering"
        "System.IO.hSetBuffering System.IO.stdout System.IO.NoBuffering"
        ":set -fno-diagnostics-show-caret -fdiagnostics-color=never -ferror-spans"
        ":set -fdefer-type-errors -fdefer-typed-holes -fdefer-out-of-scope-variables"
        ":seti -fno-defer-type-errors -fno-defer-typed-holes -fno-defer-out-of-scope-variables"
        ":set -haddock"
        ":set -fno-hide-source-paths"
        ":set -Wno-error=missing-home-modules"
    ];

}
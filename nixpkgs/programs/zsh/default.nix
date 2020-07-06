{ config, lib, pkgs, ... }:

let variables = import ./variables.nix;
in {
  home.packages = [ pkgs.z-lua pkgs.gawk pkgs.coreutils ];

  home.file.".dir_colors".source = (import ../../../nix/sources.nix).nord-dircolors + /src/dir_colors;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    history = {
      expireDuplicatesFirst = false;
      ignoreDups = false;
    };

    sessionVariables = { GITTOKEN = variables.gitToken; };

    oh-my-zsh = {
      enable = true;
      theme = "half-life";
      plugins = [
        "git"
        "sudo"
        "git-extras"
        "colored-man-pages"
      ];
    };

    plugins = with pkgs; [
      {
        name = "you-should-use";
        src = zsh-you-should-use + "/share/zsh/plugins/you-should-use";
      }
      {
        name = "fast-syntax-highlighting";
        src = zsh-fast-syntax-highlighting + /share/zsh/site-functions;
      }
    ];
    shellAliases = {

      bl = "light -U 49";
      bu = "light -A 50";

      hms = "home-manager switch";
      nsp = "nix-shell --run zsh -p";
      npd = "nix-channel --update && hms";
      nsr = "sudo nixos-rebuild switch";

      homed = "nano ~/.config/nixpkgs/home.nix";
      confed = "sudo nano /etc/nixos/configuration.nix";
      confs = "z conf; code .";

      l = "exa -lh --git";
      ll = "exa -lhT --git -L 2";
      lll = "exa -lhT --git -L 3";
      tree = "exa --tree";
      fzf = "fzf --preview 'bat --color always {}'";
      zz = "z -I";
      bd = "z -b";

      gl =
        "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset)"
        + " - %C(bold yellow)%<|(27)%ar%C(reset) %C(bold green)%<|(70)%s%C(reset) %C(dim white)-"
        + " %an%C(reset)%C(bold red)%d%C(reset)%n' --all --stat";
      gs = "git status -s";

      cal = "cal -3m";

      ktr = "kotlin";
      ktc = "kotlinc";

      copy = "xclip -sel clip";
      paste = "xclip -o -sel clip";
    };

    initExtra = ''
      setopt numericglobsort   # Sort filenames numerically when it makes sense
      setopt appendhistory     # Immediately append history instead of overwriting
      setopt histignorealldups # If a new command is a duplicate, remove the older one

      # Speed up completions
      zstyle ':completion:*' accept-exact '*(N)'
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path ~/.zsh/cache

      eval "$(dircolors ~/.dir_colors)";

      eval "$(z --init zsh enhanced once fzf)"
      export _ZL_ECHO=1

      if [ -n "$name" ]; then
        PROMPT="[$name] $PROMPT";
      fi

      if [ "$NIX_NAME" ]; then
          export PROMPT="[$NIX_NAME] $PROMPT";
      fi
    '';
  };
}

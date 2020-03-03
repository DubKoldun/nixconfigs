{ config, lib, pkgs, ... }:


{
  programs.vscode = {
      enable = true;
      extensions = [
        pkgs.vscode-extensions.ms-vscode.cpptools ] ++
        pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "csharp";
          publisher = "ms-vscode";
          version = "1.21.12";
          sha256 = "1dm879g07qw169i6jy5cmkx8cbf61acbxw7kxz3ggblkk4y48jfq";
        }
        ];
  };
}

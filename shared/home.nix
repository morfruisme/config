{ pkgs, ... }:

{
  imports = [ ./cli.nix ./editor.nix ./hyprland.nix ];
  
  home.username = "fruit"; # c'est moi 🦋
  home.homeDirectory = "/home/fruit";

  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    userName = "fruit";
    userEmail = "nico.travert@gmail.com";
  };
  programs.git-credential-oauth.enable = true;

  programs.firefox.enable = true;
  programs.vesktop.enable = true;
  
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages =
    with pkgs;
    let default = [
      bibata-cursors
      curl
      ddcui
      inotify-tools
      material-symbols
      nautilus
      nerd-fonts.jetbrains-mono
      quickshell
      unzip
      vlc
      zip
    ];
    dev = [
      bun
      clang-tools
      gcc
      glsl_analyzer
      gnumake
      nil
      qt6.qtdeclarative
      rust-analyzer
      typescript
      typescript-language-server
      vscode-css-languageserver
      (python3.withPackages (pkgs: with pkgs; [
        numpy
        pillow
        python-lsp-server
      ]))
     ];
     in default ++ dev;
}

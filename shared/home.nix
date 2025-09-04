{ pkgs, ... }:

{
  imports = [ ../modules/cli.nix ../modules/editor.nix ../modules/hyprland.nix ];
  
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

  home.packages = with pkgs; [
    aseprite
    bibata-cursors
    bun
    clang-tools
    curl
    ddcui
    glsl_analyzer
    gnumake
    inkscape
    inotify-tools
    material-symbols
    nautilus
    nerd-fonts.jetbrains-mono
    nil
    qbittorrent
    qt6.qtdeclarative
    quickshell
    rust-analyzer
    typescript
    typescript-language-server
    vlc
    vscode-css-languageserver
    zip

    (python3.withPackages (pkgs: with pkgs; [
      numpy
      pillow
      python-lsp-server
    ]))
  ];
}

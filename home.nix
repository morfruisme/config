{ pkgs, ... }:

{ 
  imports = [ ./cli ./hyprland ];

  home.username = "fruit"; # c'est moi 🦋
  home.homeDirectory = "/home/fruit";
  
  home.stateVersion = "25.05";
  
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "fruit";
    userEmail = "nico.travert@gmail.com";
  };
  programs.git-credential-oauth.enable = true;

  programs.firefox.enable = true;  
  programs.fish.enable = true;
  programs.kitty.enable = true;
  programs.vesktop.enable = true;
  programs.yazi.enable = true;

  qt.enable = true;
  qt.style.name = "adwaita";

  home.packages = with pkgs; [
    app2unit
    aubio
    bibata-cursors
    bun
    caelestia-cli
    cava
    clang-tools
    glsl_analyzer
    grim
    inotify-tools
    libqalculate
    material-symbols
    nautilus
    nerd-fonts.jetbrains-mono
    nil
    qt6.qtdeclarative
    quickshell
    rust-analyzer
    swappy
    typescript-language-server

    python3.withPackages (pkgs: with pkgs; [
      python-lsp-server
    ])
  ];
}

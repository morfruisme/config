{ lib, pkgs, ... }:

{
  _file = ./home.nix;  # Print this file's location
  imports = [
    (lib.warn "Importing helix.nix from: ${toString ./helix.nix}" ./helix.nix)
  ];
  
  # imports = [ (import ./helix.nix) ];

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

  programs.firefox = {
    enable = true;
    profiles.default.search.default = "ddg";
  };
  
  programs.fish.enable = true;
  programs.kitty.enable = true;
  programs.vesktop.enable = true;
  programs.yazi.enable = true;

  # wayland.windowManager.hyprland.enable = true;

  qt.enable = true;
  qt.style.name = "adwaita";

  home.packages = with pkgs; [
    app2unit
    aubio
    bibata-cursors
    caelestia-cli
    cava
    grim
    inotify-tools
    libqalculate
    material-symbols
    nautilus
    nerd-fonts.jetbrains-mono
    nil
    qt6.qtdeclarative
    quickshell
    swappy
  ];
}

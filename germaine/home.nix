{ pkgs, ... }:

{
  imports = [ ../home ./hyprland.nix ];
  
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    app2unit
    aubio
    caelestia-cli
    cava
    grim
    libqalculate
    stremio
    swappy
  ];
} 

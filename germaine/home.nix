{ pkgs, ... }:

{
  imports = [ ../home ./hyprland.nix ];
  
  home.stateVersion = "25.05";

  programs.caelestia = {
    enable = true;
    cli.enable = true;
  };

  home.packages = with pkgs; [
    stremio
  ];
} 

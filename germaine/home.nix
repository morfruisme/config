{ pkgs, ... }:

{
  imports = [];
  home.stateVersion = "25.05";

  # programs.qutebrowser.enable = true;
  programs.waybar.enable = true;
  
  home.packages = with pkgs; [
    aseprite
    # bottles
    godot
    inkscape
    libreoffice
    qbittorrent
    # stremio
    swaybg
    virtualbox
    # woeusb
  ];
} 

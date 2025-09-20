{ pkgs, ... }:

{
  imports = [];
  home.stateVersion = "25.05";

  # programs.qutebrowser.enable = true;
  
  home.packages = with pkgs; [
    # aseprite
    # bottles
    # godot
    inkscape
    libreoffice
    # qbittorrent
    # stremio
    virtualbox
    # woeusb
  ];
} 

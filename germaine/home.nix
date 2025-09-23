{ pkgs, ... }:

{
  imports = [];
  home.stateVersion = "25.05";

  # programs.qutebrowser.enable = true;
  programs.waybar.enable = true;
  programs.bat.enable = true;

  programs.rofi = {
    enable = true;
    theme = "dmenu";
  };
  
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

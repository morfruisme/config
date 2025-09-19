{ pkgs, ... }:

{
  imports = [ ./hyprland.nix ];

  programs.caelestia = {
    enable = true;
    cli.enable = true;
  };

  # programs.qutebrowser.enable = true;
  
  home.stateVersion = "25.05";

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

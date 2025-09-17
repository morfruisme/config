{ pkgs, ... }:

{
  programs.firefox.enable = true;
  programs.yazi.enable = true;
  
  packages = with pkgs; [
    curl
    dwm
    dwmblocks
    git
    helix
    slock
    unzip
    vlc
    zip
  ];
}

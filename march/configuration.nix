{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "march";
  system.stateVersion = "25.05";

  services.libinput.enable = true;
  
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  programs.firefox.enable = true;
  programs.yazi.enable = true;
  
  environment.systemPackages = with pkgs; [
    brightnessctl
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

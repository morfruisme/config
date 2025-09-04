{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "madeleine";
  system.stateVersion = "25.05";

  hardware.i2c.enable = true;
  
  environment.systemPackages = with pkgs; [
    ddcutil
  ];
  
  programs.hyprland.enable = true;
}

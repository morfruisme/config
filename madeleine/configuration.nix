{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "madeleine";
  system.stateVersion = "25.05";

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    ddcutil
  ];
}

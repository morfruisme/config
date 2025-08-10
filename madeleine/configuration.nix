{ ... }:

{
  imports = [ ../configuration.nix ./hardware-configuration.nix ];

  networking.hostName = "madeleine";
  system.stateVersion = "25.05";

  programs.hyprland.enable = true;
}

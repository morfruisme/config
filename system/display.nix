{ pkgs, ... }:

{
  services.displayManager.lemurs.enable = true;
  security.pam.services.swaylock = {};

  hardware.acpilight.enable = true;
  programs.niri.enable = true;

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
  ];
  
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    lm_sensors
  ];
}

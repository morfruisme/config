{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "germaine";
  system.stateVersion = "25.05";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.flatpak.enable = true;

  programs.adb.enable = true;
  programs.niri.enable = true;

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
  ];
  
  environment.systemPackages = with pkgs; [
    brightnessctl
    lm_sensors
    xwayland-satellite
  ];
 }

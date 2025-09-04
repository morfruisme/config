{ pkgs, ... }:

{
  imports = [ ../../shared/home.nix ./hardware-configuration.nix ];

  networking.hostName = "germaine";
  system.stateVersion = "25.05";

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Touchpad
  services.libinput.enable = true;

  # Power management
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  programs.adb.enable = true;
  programs.hyprland.enable = true;
  
  environment.sessionVariables = {
    XDG_SESSION_DESKTOP = "hyprland";
  };
  
  environment.systemPackages = with pkgs; [
    brightnessctl
    lm_sensors
  ];
 }

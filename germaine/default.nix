{ pkgs, ... }:

{
  imports = [ ../configuration.nix ./hardware-configuration.nix ];

  networking.hostName = "germaine";
  system.stateVersion = "25.05";

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Internet
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Touchpad
  services.libinput.enable = true;

  # Power management
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Sensor
  hardware.i2c.enable = true;

  programs.adb.enable = true;
}

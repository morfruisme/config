{ pkgs, ... }:

{
  imports = [ ../configuration.nix ./hardware-configuration.nix ];

  networking.hostName = "madeleine";
  system.stateVersion = "25.05";

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Internet
  networking.networkmanager.enable = true;

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Sensor
  hardware.i2c.enable = true;
}

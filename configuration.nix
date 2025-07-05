{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

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

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "pouler";

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "fr";
    font = "Lat2-Terminus16";
  };  

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

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 1000;
    histFile = "$HOME/.zsh_history";
  };

  programs.hyprland.enable = true;
  programs.vim.enable = true;

  hardware.i2c.enable = true;

  environment.systemPackages = with pkgs; [
    wget curl
    brightnessctl
    ddcutil
    lm_sensors
  ];
 
  # Users
  users.users.fruit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh; 
  };
}

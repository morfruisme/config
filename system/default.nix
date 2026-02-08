{ ... }:

{  
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./users.nix
    ./programs.nix
    ./network.nix
    ./display.nix
    ./audio.nix
    ./bluetooth.nix
  ];

  system.stateVersion = "25.05";
  networking.hostName = "germaine";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Paris";
  time.hardwareClockInLocalTime = false;
  
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = [ "fr_FR.UTF-8/UTF-8" ];
  i18n.extraLocaleSettings = {
    LC_TIME = "fr_FR.UTF-8";
  };

  console = {
    keyMap = "fr";
    font = "Lat2-Terminus16";
  };
}

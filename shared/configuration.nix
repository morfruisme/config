{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

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
  
  networking.networkmanager.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 1000;
    histFile = "$HOME/.zsh_history";
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
 
  users.users.fruit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  users.defaultUserShell = pkgs.zsh;  
}

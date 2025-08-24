{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Paris";
  time.hardwareClockInLocalTime = true;
  
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = [ "fr_FR.UTF-8/UTF-8" ];
  i18n.extraLocaleSettings = {
    LC_TIME = "fr_FR.UTF-8";
  };

  console = {
    keyMap = "fr";
    font = "Lat2-Terminus16";
  };
  
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # EFI boot
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

  # Internet
  networking.networkmanager.enable = true;

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Shell
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
 
  # Users
  users.defaultUserShell = pkgs.zsh;
  
  users.users.fruit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}

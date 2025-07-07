{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "fr";
    font = "Lat2-Terminus16";
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

  programs.hyprland.enable = true;
  programs.vim.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    curl
    ddcutil
    lm_sensors
    wget
  ];

  environment.sessionVariables = {
    XDG_SESSION_DESKTOP = "hyprland";
  };
 
  # Users
  users.users.fruit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
}

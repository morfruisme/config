{ pkgs, ... }:

{
  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.flatpak.enable = true;

  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    enableHardening = false;
    addNetworkInterface = false;
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
    dumpcap.enable = true;
    usbmon.enable = false;
  };

  programs.adb.enable = true;
  
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
}

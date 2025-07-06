{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
  };

  home.file."./config/hypr/hyprland.conf".source = ./hyprland.conf;
  
  services.hyprsunset.enable = true;
}

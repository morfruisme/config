{ lib, ... }:

{
  services.hyprsunset.enable = true;

  # wayland.windowManager.hyprland = {
  #   enable = true;

  #   settings = {
  #     "$mod" = "SUPER";
    
  #     "$terminal" = "kitty";
  #     "$browser" = "firefox";
  #     "$file_explorer" = "nautilus";

  #     bind = [
  #       "$mod, T, exec, $terminal"
  #       "$mod, B, exec, $browser"
  #       "$mod, E, exec $file_explorer"
  #       "$mod, M, global, caelestia:launcher"
  #       "$mod, Q, killactive"
  #       "$mod SHIFT, Q, exit"
  #       "$mod, W, togglefloating"
  #       "$mod, S, togglesplit"

  #       "$mod, left,  movefocus, l"
  #       "$mod, right, movefocus, r"
  #       "$mod, up,    movefocus, u"
  #       "$mod, down,  movefocus, d"
  #     ];
    
  #     monitor = "eDP-1, 1920x1080, 0x0, 1";
  #   };
  # };
}

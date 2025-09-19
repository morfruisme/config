{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = "eDP-1, 1920x1080, 0x0, 1";

    input.touchpad.natural_scroll = true;

    gesture = [
      "3, horizontal, workspace"
    ];

    bind = [
      "$mod, M, global, caelestia:launcher"
      "$mod, L, global, caelestia:lock"
    ];

    bindl = [
      ", XF86AudioNext,  global, caelestia:mediaNext"
      ", XF86AudioPause, global, caelestia:mediaToggle"
      ", XF86AudioPrev,  global, caelestia:mediaPrev"
    ];
  };
}

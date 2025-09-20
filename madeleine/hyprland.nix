{ ... }:

{
  imports = [ ../shared/hyprland.nix ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "desc:Philips Consumer Electronics Company PHL 271E1 0x0000089F, 1920x1080, 0x0, 1"
      "desc:Acer Technologies Acer KG221Q 0x83108499, 1920x1080, -1920x250, 1"
      "desc:Hewlett Packard HP vs19 CNN5370KZY, 1280x1024, -1280x190, 1"
    ];
  };
}

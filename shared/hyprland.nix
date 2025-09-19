{ lib, ... }:

{
  services.hyprsunset.enable = true;

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  wayland.windowManager.hyprland = {
    enable = true;
    
#     settings = {
    
#       env = [
#         "XCURSOR_SIZE, 24"
#         "XCURSOR_THEME, Bibata-Original-Classic"
#       ];

#       "$terminal" = "kitty";
#       "$browser" = "firefox";
#       "$file_explorer" = "nautilus";



#       # INPUT
    
#       input = {
#         kb_layout = "fr";
#         repeat_rate = 30;
#         repeat_delay = 300;
#         follow_mouse = 1;
#         sensitivity = 0;
#       };



#       # KEYBINDS

#       "$mod" = "SUPER";
#       bind = lib.map (b: "$mod${b}") [
#         ", T, exec, $terminal"
#         ", B, exec, $browser"
#         ", E, exec, $file_explorer"
        
#         " SHIFT, Q, exit"
#         ", Q, killactive"
#         ", W, togglefloating"
#         ", S, togglesplit"

#         ", left,  movefocus, l"
#         ", right, movefocus, r"
#         ", up,    movefocus, u"
#         ", down,  movefocus, d"

#         ",      Tab, workspace, e+1"
#         "SHIFT, Tab, workspace, e-1"
#       ]
#       ++ (let keys = [
#         "ampersand"
#         "eacute"
#         "quotedbl"
#         "apostrophe"
#         "parenleft"
#         "minus"
#         "egrave"
#         "underscore"
#         "ccedilla"
#         "agrave"
#       ]; in
#       lib.imap1 (i: key: "$mod, ${key}, workspace, ${toString i}") keys ++
#       lib.imap1 (i: key: "$mod SHIFT, ${key}, movetoworkspace, ${toString i}") keys);

#       bindm = [
#         "$mod, mouse:272, movewindow"
#         "$mod, mouse:273, resizewindow"
#       ];

#       bindel = [
#         ", XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
#         ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
#         ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
#         ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
#         ", XF86MonBrightnessUp,   exec, brightnessctl -e4 -n2 set 5%+"
#         ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
#       ];



#       # WINDOW RULES
  
#       windowrule = [
#         # Ignore maximize
#         "suppressevent maximize, class:.*"
#         # Fix dragging
#         "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
#         "opacity 0.9 0.7, class:kitty"
#       ];


 
#       # UI

#       general = {
#           border_size = 0;
#           gaps_in = 5;
#           gaps_out = 20;
          
#           allow_tearing = false;

#           layout = "dwindle";
#       };

#       decoration = {
#           blur.enabled = false;
#           shadow.enabled = false;
#       };

#       animations = {
#         enabled = false;
#         workspace_wraparound = true;
#       };

#       dwindle = {
#           pseudotile = true;
#           preserve_split = true;
#       };

#       misc = {
#           force_default_wallpaper = 0;
#           disable_hyprland_logo = true;
#       };
    # };
  };
}

{ lib, ... }:

{
  services.hyprsunset.enable = true;

  # Source config file (not used)
  # home.file.hyprland = {
  #   target = ".config/hypr/hyprland.conf";
  #   source = ./hyprland.conf;
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
    
      monitor = "eDP-1, 1920x1080, 0x0, 1";

      env = [
        "XCURSOR_SIZE, 24"
        "XCURSOR_THEME, Bibata-Original-Classic"
      ];

      # Quickshell shell
      exec-once = "qs -n -c caelestia";

      "$terminal" = "kitty";
      "$browser" = "firefox";
      "$file_explorer" = "nautilus";




      # INPUT
    
      input = {
        kb_layout = "fr";
        repeat_rate = 30;
        repeat_delay = 300;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = true;
      };

      gestures.workspace_swipe = true;




      # KEYBINDS

      "$mod" = "SUPER";
      bind = lib.map (b: "$mod${b}") [
        ", T, exec, $terminal"
        ", B, exec, $browser"
        ", E, exec, $file_explorer"
        ", M, global, caelestia:launcher"
        ", L, global, caelestia:lock"

        " SHIFT, Q, exit"
        ", Q, killactive"
        ", W, togglefloating"
        ", S, togglesplit"

        ", left,  movefocus, l"
        ", right, movefocus, r"
        ", up,    movefocus, u"
        ", down,  movefocus, d"

        ",      Tab, workspace, e+1"
        "SHIFT, Tab, workspace, e-1"
      ]
      ++ (let keys = [
        "ampersand"
        "eacute"
        "quotedbl"
        "apostrophe"
        "parenleft"
        "minus"
        "egrave"
        "underscore"
        "ccedilla"
        "agrave"
      ]; in
      lib.imap1 (i: key: "$mod, ${key}, workspace, ${toString i}") keys ++
      lib.imap1 (i: key: "$mod SHIFT, ${key}, movetoworkspace, ${toString i}") keys);

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ", XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp,   exec, brightnessctl -e4 -n2 set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext,  global, caelestia:mediaNext"
        ", XF86AudioPause, global, caelestia:mediaToggle"
        ", XF86AudioPrev,  global, caelestia:mediaPrev"
      ];




      # WINDOW RULES
  
      windowrule = [
        # Ignore maximize
        "suppressevent maximize, class:.*"
        # Fix dragging
        "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
        "opacity 0.9 0.7, class:kitty"
      ];



    
      # UI

      general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 0;
      
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          resize_on_border = false;

          allow_tearing = false;

          layout = "dwindle";
      };

      decoration = {
          shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
          };

          blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
          };
      };

      animations = {
          enabled = "yes";

          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];

          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];
      };

      dwindle = {
          pseudotile = true;
          preserve_split = true;
      };

      master.new_status = "master";

      misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
      };
    };
  };
}

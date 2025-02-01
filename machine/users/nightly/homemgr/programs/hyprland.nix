{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.variables = [ "--all" ];
    xwayland.enable = true;
    settings = {
      "$mod" = "SUPER";

      monitor = [
        "DP-2, 2560x1440@179.998001, 1920x0, 1"
        "DP-1, 1920x1080@74.973000, 0x0, 1"
      ];

      input = {
        "accel_profile" = "flat";
      };

      exec-once = [
        "hyprpaper"
        "xsettingsd"
        "wl-clipboard-history -t"
        "wayvnc"
        "waybar"
      ];

      env = [
        "XCURSOR_SIZE,20"
        "HYPRCURSOR_SIZE,24"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      bind = [
        "$mod ALT SHIFT, Q, exit"
        "$mod, Q, exec, ghostty"
        "$mod, E, exec, dolphin"
        "$mod, C, killactive"
        "$mod, V, togglefloating"
        "$mod, tab, exec, tofi-drun --drun-launch=true --fuzzy-match=true"
        "$mod, S, exec, grimblast --notify copysave area"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(a9b665ff)";
        "col.inactive_border" = "rgba(7c6f64ff)";
        layout = "dwindle";
        resize_on_border = true;
        extend_border_grab_area = 15;
        hover_icon_on_border = true;
        no_focus_fallback = false;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
          disable_while_typing = true;
          drag_lock = true;
          clickfinger_behavior = true;
          middle_button_emulation = true;
          tap-to-click = true;
        };
      };

      decoration = {
        rounding = 0;
        active_opacity = 0.95;
        inactive_opacity = 0.85;
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          xray = true;
        };
        # drop_shadow = false;
      };

      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "linear, 0.0, 0.0, 1.0, 1.0"
        ];
        animation = [
          "windows, 1, 4, myBezier"
          "windowsOut, 1, 4, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, linear, loop"
          "fade, 1, 5, default"
          "workspaces, 1, 3, default, slide"
        ];
      };

      windowrulev2 = [
        "noblur, class:^(brave-browser)$"
        # "noshadow, class:^(brave-browser)$"
        # "noborder, class:^(brave-browser)$"
        "opaque, class:^(brave-browser)(.*)$"
        "opaque, title:(.*)([Mm])(inecraft)(.*)$"
        # "forcergbx, class:^(brave-browser)$"
        "float, class:^(pavucontrol)$"
        "float, class:^(blueman-manager)$"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}

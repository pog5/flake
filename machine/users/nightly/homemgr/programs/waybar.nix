{ config, pkgs, ... }: {
  # programs.waybar = {
  #   enable = true;
  #   settings = {
  #     mainBar = {
  #       layer = "top";
  #       position = "top";
  #       height = 32;
  #       output = [ "DP-2" "HDMI-A-1" ];

  #       modules-left =
  #         [ "hyprland/workspaces" "hyprland/submap" "wlr/taskbar" ];
  #       modules-center = [ "hyprland/window" ];
  #       modules-right = [ "mpd" "temperature" ];

  #       "hyprland/window" = { "seperate-outputs" = true; };
  #     };
  #   };
  # };
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "hyprland-session.target";
    };
    settings = {
      mainBar = {
        layer = "bottom";
        position = "bottom";
        height = 44;
        spacing = 0;
        output = [ "DP-2" "HDMI-A-1" ];

        modules-left = [ "hyprland/workspaces" "cpu" ];
        modules-center = [ "mpris" ];
        modules-right = [ "memory" "network" "pulseaudio" "clock" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
          "format-icons" = {
            active = ">:3";
            # active = "󰝤";
            default = ":3";
            # default = "󰝣";
          };
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };

        clock = {
          format = "{:%H:%M}";
          # format = "{:%d %B | %H:%M}";
          # "tooltip-format" = "{:%A, %d %B %Y}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        cpu.format = "CPU {usage}%";
        cpu.interval = 2;

        memory.format = "RAM {percentage}%";
        memory.interval = 2;

        network = {
          format = "NET {bandwidthDownBits}";
          "format-disconnected" = "OFFLINE";
          interval = 2;
        };

        pulseaudio = {
          format = "VOL {volume}%";
          "format-muted" = "MUTE";
          "on-click" = "pavucontrol";
        };

        mpris = {
          format = "{artist} - {title}";
          "format-paused" = "[PAUSE] {artist} - {title}";
          "max-length" = 50;
        };
      };
    };

    style = ''
      @define-color bg_h   #1d2021;
      @define-color bg0    #282828;
      @define-color bg1    #3c3836;
      @define-color bg2    #504945;
      @define-color bg3    #665c54;
      @define-color bg4    #7c6f64;
      @define-color fg0    #fbf1c7;
      @define-color fg1    #ebdbb2;
      @define-color fg2    #d5c4a1;
      @define-color fg3    #bdae93;
      @define-color fg4    #a89984;
      @define-color red    #ea6962;
      @define-color green  #a9b665;
      @define-color yellow #d8a657;
      @define-color blue   #7daea3;
      @define-color purple #d3869b;
      @define-color aqua   #89b482;
      @define-color orange #e78a4e;
      @define-color gray   #928374;

      * {
        border: none;
        border-radius: 0;
        font-family: "JetbrainsMono Nerd Font Mono";
        font-size: 15px;
        min-height: 0;
        margin: 0;
        padding: 0;
      }

      window#waybar {
        background: @bg_h;
        color: @fg1;
      }

      #workspaces {
        background: @bg0;
        margin: 4px;
        padding: 0 2px;
      }

      #workspaces button {
        color: @fg4;
        padding: 0 4px;
        margin: 4px 2px;
      }

      #workspaces button.active {
        color: @fg0;
      }

      #workspaces button:hover {
        color: @fg3;
      }

      #workspaces button.urgent {
        color: @red;
      }

      #mpris,
      #network,
      #cpu,
      #memory,
      #clock,
      #pulseaudio {
        background: @bg0;
        color: @fg1;
        padding: 0 8px;
        margin: 4px 2px;
      }

      #network { color: @blue; }
      #cpu { color: @green; }
      #memory { color: @yellow; }
      #clock { color: @fg0; }
      #pulseaudio { color: @aqua; }

      tooltip {
        background: @bg0;
        border: 1px solid @bg2;
      }

      tooltip label {
        color: @fg1;
      }
    '';
  };
}

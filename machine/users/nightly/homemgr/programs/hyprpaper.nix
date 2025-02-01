{ config, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      # ipc = "on";
      # splash = true;
      # splash_offset = 2.0;

      preload = [ "/home/nightly/Pictures/Wallpapers/vis.png" ];

      wallpaper = [
        "DP-2,/home/nightly/Pictures/Wallpapers/vis.png"
        "DP-1,/home/nightly/Pictures/Wallpapers/vis.png"
      ];
    };
  };
}

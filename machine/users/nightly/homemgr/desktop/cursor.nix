{ config, pkgs, ... }: {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Catpppuccin-Mocha-Mauve";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}

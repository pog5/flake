{
  config,
  pkgs,
  lib,
  ghostty,
  ...
}:
{
  # home.packages = [ ghostty.packages.x86_64-linux.ghostty ];

  xdg.configFile."ghostty/config".text = ''
    confirm-close-surface = false
    custom-shader-animation = true
    window-padding-balance = true
    background-opacity = 0.8
    background-blur-radius = 20
    theme = OneHalfDark
    foreground = #dcdfe4
    selection-background = #474e5d
    selection-foreground = #dcdfe4
    cursor-color = #a3b3cc
    cursor-text = #dcdfe4
    cursor-opacity = 0.5
    palette = 0=#282c34
    palette = 1=#e06c75
    palette = 2=#98c379
    palette = 3=#e5c07b
    palette = 4=#61afef
    palette = 5=#c678dd
    palette = 6=#56b6c2
    palette = 7=#dcdfe4
    palette = 8=#282c34
    palette = 9=#e06c75
    palette = 10=#98c379
    palette = 11=#e5c07b
    palette = 12=#61afef
    palette = 13=#c678dd
    palette = 14=#56b6c2
    palette = 15=#dcdfe4
    font-family = CommitMono Nerd Font
    font-style-bold = Bold
    font-style-italic = Italic
    font-style-bold-italic = Bold Italic
  '';
}

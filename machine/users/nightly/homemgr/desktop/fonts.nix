{ config, pkgs, ... }: {
  # comments -> these must be set on system config
  fonts = {
    # enableDefaultPackages = true;
    # fontDir.enable = true;
    fontconfig = {
      enable = true;
      # useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [ "Liberation Serif" "Noto Serif" "Noto Color Emoji" ];
        sansSerif =
          [ "Inter" "Liberation Sans" "Noto Sans" "Noto Color Emoji" ];
        monospace = [
          "CommitMono"
          "Cozette"
          "JetBrains Mono"
          "Liberation Mono"
          "Noto Sans Mono"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
      # antialias = true;
      # hinting = {
      #   enable = true;
      #   style = "slight";
      # };
      # subpixel = {
      #   rgba = "rgb";
      #   lcdfilter = "default";
      # };
    };
  };
}

{ config, pkgs, ... }: {
  programs.mpv = {
    enable = true;
    config = {
      # Video
      profile = "high-quality";
      vo = "gpu-next";
      scale-antiring = 0.6;

      # Dither, must match monitor bit depth
      dither-depth = 8;

      # Behaviour
      #keep-open = false;
      #save-position-on-quit

      # Screenshots
      screenshot-format = "png";
      screenshot-dir = "~/Pictures/mpv";
      screenshot-template = "%F-%p-%n";
      screenshot-high-bit-depth = false;

      # Language Priority
      # Sub
      slang = "eng,en";
      alang = "jpn,ja";
    };
  };
}

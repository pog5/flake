{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "CommitMono Nerd Font";
      size = 12;
    };
  };
}

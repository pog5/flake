{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    themeFile = "GruvboxMaterialDarkSoft";
    font = {
      name = "CommitMono Nerd Font";
      size = 12;
    };
  };
}

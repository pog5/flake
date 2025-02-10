{ config, pkgs, ... }:
{
  programs.micro = {
    enable = true;
    settings = {
      "colorscheme" = "one-dark";
    };
  };
}

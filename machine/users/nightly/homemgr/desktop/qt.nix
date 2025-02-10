{ config, pkgs, ... }:
{
    qt = {
        enable = true;
        platformTheme = {
            name = "kde";
            package = pkgs.catppuccin-kde.override {
                accents = [ "mauve" ];
                flavour = [ "mocha" ];
            };
        };
        style = {
            name = "kvantum";
            package = pkgs.catppuccin-kvantum.override {
                accent = "mauve";
                variant = "mocha";
            };
        };
    };
}
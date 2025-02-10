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
            name = "breeze";
            package = pkgs.catppuccin-kvantum.override {
                accent = "mauve";
                variant = "mocha";
            };
        };
    };
}

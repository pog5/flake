{ config, pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox_material_dark_soft";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
    }];
    themes = {
      gruvbox_material_dark_soft = {
        "inherits" = "gruvbox_dark_soft";
        "ui.background" = { };
      };
    };
  };
}

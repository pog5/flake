{ config, pkgs, lib, ghostty, ... }: {
  # home.packages = [ ghostty.packages.x86_64-linux.ghostty ];

  xdg.configFile."ghostty/config".text = ''
    window-padding-balance = true
    cursor-style = bar
    font-family = CommitMono Nerd Font Mono
    font-family-bold = CommitMono Nerd Font Mono
    font-family-italic = CommitMono Nerd Font Mono
    font-family-bold-italic = CommitMono Nerd Font Mono
  '';
}

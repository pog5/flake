{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./users/nightly

    ./services/dynamicdns.nix
    ./services/pipewire.nix
    ./services/openssh.nix
    ./services/zerotier.nix

    ./hardware.nix
    ./firewall.nix
    ./virtualisation.nix
    ./fonts.nix
    ./nixcfg.nix
    ./nvidia.nix
    ./tablet.nix
    ./locale.nix
    ./boot.nix
  ];

  networking.hostId = "beefbeed";
  networking.hostName = "nixagon";

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  programs.hyprland = {
    enable = true;
    #  xwayland.enable = true;
    #  portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [ age ];

  services.xserver.displayManager.gdm.enable = true;

  system.stateVersion = "24.11";
}

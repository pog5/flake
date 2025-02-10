{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
  	./overlays.nix
  	
    ./users/nightly

    ./services/dynamicdns.nix
    ./services/pipewire.nix
    ./services/openssh.nix
    ./services/zerotier.nix
    ./services/undervolt.nix
    ./services/networkmanager.nix
    ./services/zram.nix
    ./services/kwallet.nix

    ./hardware.nix
    ./firewall.nix
    ./virtualisation.nix
    ./fonts.nix
    ./nixcfg.nix
    #./nvidia.nix
    ./tablet.nix
    ./locale.nix
    ./boot.nix
  ];

  networking.hostId = "beefbeed";
  networking.hostName = "sprout";

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  programs.hyprland = {
    enable = false;
    #  xwayland.enable = true;
    #  portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  services.xserver.enable = false;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [ age ];

  security.sudo-rs.enable = true;

  system.stateVersion = "25.05";
}

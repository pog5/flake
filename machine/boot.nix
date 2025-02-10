{ config, lib, pkgs, ... }: {
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
}

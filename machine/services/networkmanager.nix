{ config, pkgs, ... }: {
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
  };
}

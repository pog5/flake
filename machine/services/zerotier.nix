{ config, pkgs, lib, ...}: {
  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "e4da7455b2d007c5"
    ];
  };
}
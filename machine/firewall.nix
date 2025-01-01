{ config, pkgs, lib, ... }: {
  networking.nftables.enable = true; # instead of iptables

  networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      22 # ssh
      5900 # vnc
      # 25565
    ];
    allowedTCPPortRanges = [
      # { from = 60565; to = 65565 }
    ];

    allowedUDPPorts = [
      26000 # xonotic
      # 25565
    ];
    allowedUDPPortRanges = [
      # { from = 60565; to = 65565 }
    ];
  };
}

{ config, lib, pkgs, ... }: {
  users.users.dynamicdns = {
    isSystemUser = true;
    group = "dynamicdns";
  };

  users.groups.dynamicdns = { };

  systemd.services.dynamic-dns-updater = {
    serviceConfig.User = "dynamicdns";
    path = [ pkgs.curl ];
    script =
      "curl 'https://www.duckdns.org/update?domains=pog5&token=c16d628c-d1e1-4794-9083-1ec17730a7bb'";
    startAt = "hourly";
  };

  systemd.timers.dynamic-dns-updater.timerConfig.RandomizedDelaySec = "15m";
}

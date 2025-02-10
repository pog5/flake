{ config, pkgs, lib, ... }: 
{
  programs.ssh.startAgent = true;
  
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    settings = {
      PermitRootLogin = "without-password";
      PasswordAuthentication = true;
      MaxAuthTries = 3;
      MaxSessions = 9;
      LogLevel = "ERROR";
      TCPKeepAlive = false;
      ClientAliveCountMax = 24;
      ClientAliveInterval = 3600;
    };
  };

  systemd.services."sshd@" = {
    serviceConfig = { OOMScoreAdjust = "-1000"; };
    unitConfig = { IgnoreOnIsolate = true; };
  };
}

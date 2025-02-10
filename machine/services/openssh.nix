{ config, pkgs, lib, ... }: 
{
  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
    askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
  };
  
  environment.variables = {
    SSH_ASKPASS_REQUIRE = "prefer";
  };
  
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

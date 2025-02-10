{ config, lib, pkgs, ... }:
{ 
# 	programs.ssh = {
# 		startAgent = true;
# 		askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass}/bin/ksshaskpass";
# 	};
# 
# 	environment.sessionVariables = {
# 		SSH_ASKPASS_REQUIRE="prefer";
# 	};
	systemd.user.services.add-ssh-key = {
	  inherit (config.systemd.user.services.ssh-agent) unitConfig wantedBy;
	  bindsTo = [
	    "ssh-agent.service"
	  ];
	  environment.SSH_AUTH_SOCK = "/run/user/%U/ssh-agent";
	  path = [
	    programs.ssh.package.value
	  ];
	  script = "${options.programs.ssh.package.value}/bin/ssh-add";
	  serviceConfig = {
	    CapabilityBoundingSet = "";
	    LockPersonality = true;
	    NoNewPrivileges = true;
	    ProtectClock = true;
	    ProtectHostname = true;
	    PrivateNetwork = true;
	    ProtectKernelLogs = true;
	    ProtectKernelModules = true;
	    ProtectKernelTunables = true;
	    RestrictAddressFamilies = "AF_UNIX";
	    RestrictNamespaces = true;
	    SystemCallArchitectures = "native";
	    SystemCallFilter = "~@clock @cpu-emulation @debug @module @mount @obsolete @privileged @raw-io @reboot @resources @swap";
	    UMask = "0777";
	  };
	};
}

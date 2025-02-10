{ config, lib, pkgs, ... }: 
{
	security.pam.services.kwallet = {
		name = "kdewallet";
		enableKwallet = true;
	};

	programs.gnupg.agent = {
	  enable = true;
	  enableSSHSupport = false;
	  settings = {
	    default-cache-ttl = 2592000;
	    max-cache-ttl = 2592000;
	  };
	};
}

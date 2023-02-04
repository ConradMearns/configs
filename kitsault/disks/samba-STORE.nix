{ ... }:

{
	services.samba-wsdd.enable = true;
	networking.firewall.allowedTCPPorts = [ 5357 ];
	networking.firewall.allowedUDPPorts = [ 3702 ];

	services.samba = {
		enable = true;
		securityType = "user";
		shares = {
			public = {
				path = "/store/";
				browseable = "yes";
				"read only" = "no";
				#"guest ok" = "yes";
				"create mask" = "0644";
				"directory mask" = "0755";
				#"force user" = "username";
				#"force group" = "groupname";
			};
		};
	};
}

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
				path = "/store";
				writeable = "yes";
				browseable = "yes";
			};
		};		
	};
}

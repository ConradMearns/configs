{ ... }:

{
	services.samba-wsdd.enable = true;
	networking.firewall.allowedTCPPorts = [ 5357 445 139 ];
	networking.firewall.allowedUDPPorts = [ 3702 137 138 ];

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

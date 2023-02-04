{ ... }:

{
	services.samba-wsdd.enable = true;
	networking.firewall.allowedTCPPorts = [ 5357 ];
	networking.firewall.allowedUDPPorts = [ 3702 ];

	services.samba = {
		enable = true;
		#securityType = "user";
		enableNmbd = true;

		extraConfig = ''
			workgroup = WORKGROUP
			server string = kitsault
			netbios name = kitsault
			security = user 
			#use sendfile = yes
			#max protocol = smb2
			# note: localhost is the ipv6 localhost ::1
			#hosts allow = 192.168.0. 127.0.0.1 localhost
			hosts allow = 0.0.0.0/0 127.0.0.1 localhost
			#hosts deny = 0.0.0.0/0
			guest account = nobody
			map to guest = bad user
		'';

		shares = {
			public = {
				path = "/store";
				browseable = "yes";
				"writable" = "yes";
				"guest ok" = "yes";
				#"create mask" = "0644";
				#"directory mask" = "0755";
				"force user" = "conrad";
			};
		};
	};
}

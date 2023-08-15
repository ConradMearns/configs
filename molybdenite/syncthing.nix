{ ... }:

{
	services.syncthing = {
		enable = true;
		user = "conrad";
		openDefaultPorts = true;
		dataDir = "/home/conrad/";
		guiAddress = "0.0.0.0:8384";
	};

	# Syncthing ports
	networking.firewall.allowedTCPPorts = [ 8384 22000 ];
	networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}

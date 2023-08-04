{ ... }:

{
	services.syncthing = {
		enable = true;
		openDefaultPorts = true;
		# dataDir = "~/syncthing/";
		guiAddress = "0.0.0.0:8384";
	};

	# Syncthing ports
	networking.firewall.allowedTCPPorts = [ 8384 22000 ];
	networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}

{ ... }:

{
	services.syncthing = {
		enable = true;
		openDefaultPorts = true;
		dataDir = "/store/syncthing/";
		guiAddress = "0.0.0.0:8384";
	};
}

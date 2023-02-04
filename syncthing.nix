{ ... }:

{
	services.syncthing = {
		enable = true;
		dataDir = "/store/syncthing/";
		guiAddress = "0.0.0.0:7962";
	};
}

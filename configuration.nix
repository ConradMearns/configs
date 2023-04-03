{ config, pkgs, ...}:

{
	environment.systemPackages = with pkgs; [
		vim
		git
		gh
		direnv
		apfs-fuse

		nssmdns
		avahi
	];

	services.avahi = {
		enable = true;
		publish = {
			enable = true;
			addresses = true;
			workstation = true;
		};
		nssmdns = true;
	};


}

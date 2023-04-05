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

	nix.trustedUsers = [ "conrad" ];

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

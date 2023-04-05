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

	nix.settings.trusted-users = [ "conrad" ];
	security.sudo.wheelNeedsPassword = false;

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

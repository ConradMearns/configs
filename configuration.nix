{ config, pkgs, ...}:

{
	environment.systemPackages = with pkgs; [
		vim
		git
		gh
		direnv
		apfs-fuse
	];
}

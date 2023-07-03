{ pkgs, ... }:
{
	environment.systemPackages = [
    pkgs.unstable.minecraft
    # pkgs.obsidian
  ];
}

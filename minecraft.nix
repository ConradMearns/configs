{ pkgs, ... }:
{
	environment.systemPackages = [
    pkgs.unstable.minecraft
    pkgs.unstable.prismlauncher
    # pkgs.obsidian
  ];
}

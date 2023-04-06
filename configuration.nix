{ config, pkgs, ...}:

# 	let
# 	my-python-packages = ps: with ps; [
#   # ...
#   (
#     buildPythonPackage rec {
# 			pname = "mdns-publisher";
# 			version = "0.9.2";
#       src = fetchPypi {
#         inherit pname version;
#         sha256 = "sha256-sjCQKnsFR6w3IwCvZ1GDw0VqnLjEbO3ecgKOJrSZj84==";
#       };
# 			doCheck = false;
# 			propagatedBuildInputs = with pythonPackages; [
# 				dbus-python
# 			];
# 		}
#   )
# ];
# in
{

	environment.systemPackages = with pkgs; [
		vim
		git
		gh
		direnv
		apfs-fuse

		nssmdns
		avahi
		# mdns-publisher
		# (pkgs.python3.withPackages my-python-packages)
	];

	nix.settings.trusted-users = [ "conrad" ];
	security.sudo.wheelNeedsPassword = false;

	services.avahi = {
		enable = true;
		publish = {
			enable = true;
			addresses = true;
			workstation = true;
			domain = true;
		};
		# extraConfig = ''
		# [server]
		# entries-per-entry-group-max=32
		# enable-dbus=yes

		# [publish]
		# publish-hinfo=yes
		# publish-workstation=yes
		# disable-publishing=no
		# disable-user-service-publishing=no
		# '';
		nssmdns = true;
	};


}

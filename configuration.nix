{ config, pkgs, ... }:

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

    nixfmt

    nssmdns
    avahi

    # for reSnap
    ffmpeg
    feh
    lz4

    # mdns-publisher
    # (pkgs.python3.withPackages my-python-packages)
  ];

  nix.settings.trusted-users = [ "conrad" ];
  nix.settings.experimental-features = "nix-command flakes";
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

  i18n.inputMethod.enabled = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [ libpinyin ];

  fonts.fontDir.enable = true;

  # GIVES ACCESS TO ALL USERS for Lego NXT Modules connectesudo nixos-rebuild switch --flake .

  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0694", ATTRS{idProduct}=="0002", MODE="0666"
  '';

}

{ pkgs, ... }:

{
  users.users.conrad = {
    isNormalUser = true;
    description = "conrad";
    extraGroups = [ "networkmanager" "wheel" ];

    packages = with pkgs; [
	firefox
	gh
	vscode
    ];
  };
}

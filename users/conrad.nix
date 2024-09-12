{ pkgs, ... }:

{
  users.users.conrad = {
    isNormalUser = true;
    description = "conrad";
    extraGroups = [ "networkmanager" "wheel" "plugdev"];
    packages = with pkgs; [
      firefox
      gh
      vscode
      # google-chrome
      nodejs
      python3
    ];
  };
}

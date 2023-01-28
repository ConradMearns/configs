{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    zerotierone
  ];

  services.zerotierone = {
    enable = true;
    joinNetworks = [ 
      "e4da7455b2639267" # 康网 - Private
    ];
  };

  boot.cleanTmpDir = true;
  networking.hostName = "kitsault";
  networking.firewall.allowPing = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  system.stateVersion = "22.11";
}

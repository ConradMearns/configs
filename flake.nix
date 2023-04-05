{
  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  # inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;

  outputs = { self, nixpkgs, ... }@attrs: {

    nixosConfigurations.kitsault = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./configuration.nix
        ./users/conrad.nix
        ./kitsault/configuration.nix
        ./kitsault/disks/STORE.nix
        ./kitsault/disks/samba-STORE.nix
        ./kitsault/octoprint.nix
        ./kitsault/deluge.nix
        ./syncthing.nix
        ./zerotier-kangwang.nix
        # ./mdns-publisher/mdns-publisher.nix
      ];
    };

    # Lenovo Laptop
    nixosConfigurations.wulfenite = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./configuration.nix
        ./users/conrad.nix
        ./wulfenite/configuration.nix
        # ./zerotier-kangwang.nix
      ];
    };


    # Dell XPS 13
    nixosConfigurations.molybdenite = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./configuration.nix
        ./users/conrad.nix
        ./molybdenite/luks.nix
        ./molybdenite/configuration.nix
        ./zerotier-kangwang.nix
        ./obsidian.nix
        ./fonts.nix
      ];
    };



  };
}

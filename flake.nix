{
  inputs.nixpkgs.url = github:NixOS/nixpkgs;

  outputs = { self, nixpkgs, ... }@attrs: {

    nixosConfigurations.kitsault = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./kitsault/disks/samba-STORE.nix
        ./configuration.nix
        ./syncthing.nix
        ./kitsault/configuration.nix
        ./kitsault/disks/STORE.nix
        ./zerotier-kangwang.nix
        ./users/conrad.nix
      ];
    };

    # Lenovo Laptop
    nixosConfigurations.wulfenite = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./configuration.nix
        ./wulfenite/configuration.nix
        ./users/conrad.nix
        # ./zerotier-kangwang.nix
      ];
    };


    # Dell XPS 13
    nixosConfigurations.molybdenite = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./molybdenite/boot.nix
        ./configuration.nix
        ./molybdenite/configuration.nix
        ./users/conrad.nix
      ];
    };



  };
}

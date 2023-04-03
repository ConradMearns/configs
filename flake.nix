{
  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  # inputs.unstable.url = "github:NixOS/nixpkgs-unstable";

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
        ./kitsault/cockpit.nix
        ./syncthing.nix
        ./zerotier-kangwang.nix
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

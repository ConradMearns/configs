{
  inputs.nixpkgs.url = github:NixOS/nixpkgs;

  outputs = { self, nixpkgs, ... }@attrs: {

    nixosConfigurations.kitsault = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./kitsault/configuration.nix
	./users/conrad.nix
      ];
    };

    # Lenovo Laptop
    nixosConfigurations.wulfenite = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
	./wulfenite/configuration.nix
	./users/conrad.nix
      ];
    };
  };
}

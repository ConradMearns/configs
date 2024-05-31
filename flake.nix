{
  # inputs.unstable.url = "github:NixOS/nixpkgs";
  # inputs.nixpkgs-unstable.url = "github:NixOS/nixpkgs";

  # inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  # https://github.com/msteen/nixos-vscode-server
  # inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  inputs.nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.vscode-server.url = "github:msteen/nixos-vscode-server";

  outputs = { self, nixpkgs, nixpkgs-unstable, vscode-server, ... }@attrs:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        # unstable = nixpkgs-unstable.legacyPackages.${prev.system};
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
          config.permittedInsecurePackages = [
            "electron-25.9.0" # how frustrating
          ];
        };
      };
    in {
      nixosConfigurations.kitsault = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
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
          vscode-server.nixosModule
          ({ config, pkgs, ... }: { services.vscode-server.enable = true; })
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
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./configuration.nix
          ./users/conrad.nix
          ./molybdenite/luks.nix
          ./molybdenite/configuration.nix
          ./molybdenite/syncthing.nix
          ./zerotier-kangwang.nix
          ./obsidian.nix
          ./minecraft.nix
          ./fonts.nix
          # nixos-hardware.nixosModules.dell-xps-13-9380
        ];
      };

    };
}

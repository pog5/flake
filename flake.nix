{
  description = "nightly's nixos config <3";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, agenix, ghostty, ... }: {
    nixosConfigurations.nixagon = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      # Define pkgs here
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "dotnet-runtime-6.0.36" # for opentabletdriver
            "dotnet-sdk-wrapped-6.0.428" # ^
            "dotnet-sdk-6.0.428" # ^
          ];
        };
      };

      modules = [
        ./machine

        {
          environment.systemPackages = [
            ghostty.packages.x86_64-linux.default
          ];
        }

        agenix.nixosModules.default
        ({ config, pkgs, system, lib, options, ... }: {
          nix.registry.nixpkgs.flake = nixpkgs;
        })

        home-manager.nixosModules.home-manager
        {
          home-manager.backupFileExtension = "hm-bkup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.nightly = import ./machine/users/nightly/homemgr;
        }
      ];
    };
  };
}

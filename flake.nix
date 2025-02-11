{
  description = "nightly's nixos config <3";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
   	  inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      agenix,
      lix-module,
      nvf,
      ...
    }:
    {
      nixosConfigurations.sprout = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # Define pkgs here
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
            # permittedInsecurePackages = [
            #   "dotnet-runtime-6.0.36" # for opentabletdriver
            #   "dotnet-sdk-wrapped-6.0.428" # ^
            #   "dotnet-sdk-6.0.428" # ^
            # ];
          };
        };

        modules = [
          lix-module.nixosModules.default
          agenix.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "hm-bkup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.nightly = import ./machine/users/nightly/homemgr;
          }

          ./machine
        ];
      };
    };
}

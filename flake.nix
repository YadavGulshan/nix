{
  description = "My Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-ld, ...}: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;	
    };
    lib = nixpkgs.lib;
  in {
  nixosConfigurations = {
      gulshan = lib.nixosSystem rec {
        inherit system;
        modules = [ 
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gulshan = import ./home/home.nix ;
          }

          nix-ld.nixosModules.nix-ld
          { programs.nix-ld.dev.enable = true; }
        ];
      };
    };
  };

}

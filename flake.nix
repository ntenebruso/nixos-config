{
  description = "Nick's Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        ntthinkpad = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/ntthinkpad/configuration.nix ];
        };
      };
      homeConfigurations = {
        "nick@ntthinkpad" = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [
            ./home/nick/ntthinkpad.nix
	  ];
	};
      };
  };
}

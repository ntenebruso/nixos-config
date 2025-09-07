{
  description = "Nick's Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    neoshell.url = "github:ntenebruso/NeoShell";

    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        ntthinkpad = lib.nixosSystem {
          modules = [ ./hosts/ntthinkpad/configuration.nix ];
        };
      };
      homeConfigurations = {
        "nick@ntthinkpad" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            inputs.plasma-manager.homeManagerModules.plasma-manager
            inputs.stylix.homeModules.stylix
            inputs.neoshell.homeManagerModules.neoshell
            ./home/nick/ntthinkpad.nix
          ];
        };
      };
    };
}

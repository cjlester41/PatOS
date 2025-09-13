{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, chaotic, home-manager, ... }@inputs: let

    user = "ppierce";
    system = "x86_64-linux";

  in { 
    nixosConfigurations = {

      PatOS = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/gaming
          ./gpu/nvidia.nix
        ];
      specialArgs = {
          inherit inputs;
          inherit user;
        };
      }; 
    };
  };
}


{
  description = "NixOS config";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    caelestia = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };  
  
  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations =
    
    let makeHost = name: nixpkgs.lib.nixosSystem {
      system = "86_64-linux";
      modules = [
        ./configuration.nix
        ./hosts/${name}/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [
              inputs.caelestia.homeManagerModules.default
            ];
            users.fruit = import ../hosts/${name}/home.nix;
          };
        }
      ];
    }; in

    {
      germaine = makeHost "germaine";
      madeleine = makeHost "madeleine";
    };
  };
}

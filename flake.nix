{
  description = "NixOS config";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };  
  
  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.germaine = nixpkgs.lib.nixosSystem {
      system = "86_64-linux";
      modules = [
        ./system
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.fruit = {
              imports = [
                ./home
              ];
            };
          };
        }
      ];
    };
  };
}

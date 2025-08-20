{
  description = "Root";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    quickshell.url = "github:quickshell-mirror/quickshell";
    caelestia-cli.url = "github:alisonjenkins/cli";
  };  
  
  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations =
    
    let config = username: nixpkgs.lib.nixosSystem {
      system = "86_64-linux";
      modules = [
        ./configuration.nix
        ./${username}/configuration.nix

        {
          nixpkgs.config.allowUnfree = true;
          
          # Packages that don't follow nixpkgs version (override the ones that do)
          nixpkgs.overlays = [ (_: super:
            nixpkgs.lib.mapAttrs (_: pkg: pkg.packages.${super.system}.default)
            (with inputs; { inherit quickshell; inherit caelestia-cli; })
          ) ];
        }

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.fruit = import ./${username}/home.nix;
          };
        }
      ];
    }; in

    {
      germaine = config "germaine";
      madeleine = config "madeleine";
    };
  };
}

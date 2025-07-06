{
  description = "NixOS configuration";

  inputs = {
  
    # Default to unstable branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";


    walker.url = "github:abenz1267/walker";

    bzmenu.url = "github:e-tho/bzmenu";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  }: 
{
    nixosConfigurations = {
      nixos = let
        system = "x86_64-linux";
        username = "morgan";
      in 
        nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          pkgs-stable = import nixpkgs-stable {
            inherit system;
          };
          };
          modules = [
            ./hosts/dell-xps13
            ./modules/niri.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}

{
  description = "My first NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hydenix = {
    #   url = "github:richen604/hydenix";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, disko, home-manager, stylix, niri, noctalia, ... }@inputs:
  let
    system = "x86_64-linux";
    hostname = "nixos";

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    user = import ./user.nix;

  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs pkgs-unstable user;
      };

      modules = [
        disko.nixosModules.disko

        ./configuration.nix

        home-manager.nixosModules.home-manager
        # niri.nixosModules.niri

        {
          home-manager = {
            useGlobalPkgs = true; # true;
            useUserPackages = true;
            extraSpecialArgs = { inherit pkgs-unstable inputs user; };
            users.${user.username} = {
              imports = [
                # inputs.stylix.homeModules.stylix
                ./home/default.nix
              ];
            };
          };
        }
      ];
    };
  };
}

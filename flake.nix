{
  description = "dub's flake setting";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

    in
    {
      nixosModules = import ./modules/nixos;

      homeManagerModules = import ./modules/home-manager;

      desktopModules = import ./desktop;

      nixosConfigurations = {
        wow = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            inputs.nur.modules.nixos.default
            ./nixos/wow/configuration.nix
          ];
        };

        minipc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/minipc/configuration.nix
            ./nixos/minipc/nur.nix
          ];
        };
      };

      homeConfigurations = {
        "dub@wow" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."${system}";
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home-manager/dub-wow/home.nix
          ];
        };
        "box@minipc" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."${system}";
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home-manager/box-minipc/home.nix
          ];
        };
      };
    };
}

{
  description = "dub's flake setting";
  
  inputs = {
    nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, ...}: {
    nixosConfigurations.wow = nixpkgs.lib.nixosSystem {
      specialArgs = { 
      	inherit inputs;
      };
      modules = [
        ./hosts/wow/configuration.nix
      ];
    };
  };

}

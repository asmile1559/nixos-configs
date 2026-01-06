{ pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.dub = import ./home/home.nix {
      inherit pkgs;
      inherit inputs;
    };
    backupFileExtension = "backup";
  };
}

{
  description = "Home Manager configuration of hldmna";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    alejandra,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    formatter.${system} = alejandra.defaultPackage.${system};
    homeConfigurations = {
      hldmna = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          {
            home.username = "hldmna";
            home.homeDirectory = "/home/hldmna";
            home.stateVersion = "22.11";
          }
        ];
      };
      nixos = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          {
            home.username = "nixos";
            home.homeDirectory = "/home/nixos";
            home.stateVersion = "22.11";
          }
        ];
      };
    };
  };
}

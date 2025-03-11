{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager/master";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-index-database,
    catppuccin,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in rec {
    homeManagerModules = [
      ./home-manager
      catppuccin.homeManagerModules.catppuccin

      nix-index-database.hmModules.nix-index

      {programs.nix-index-database.comma.enable = true;}
    ];

    homeConfigurations.andreas = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = homeManagerModules;
    };
  };
}

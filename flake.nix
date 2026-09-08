{
  description = "Library of Prospero";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      zen-browser,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        prospero = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit system;
            inherit zen-browser;
          };
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}

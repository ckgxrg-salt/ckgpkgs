{
  description = "ckgxrg's trivial NixOS packages";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };
  };
  outputs =
    {
      nixpkgs,
      ags,
      astal,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          permittedInsecurePackages = [
            "olm-3.2.16"
          ];
        };
      };
    in
    {
      packages.${system} = import ./packages { inherit pkgs ags astal; };

      devShell.${system} = pkgs.mkShellNoCC {
        name = "ckgpkgs";
      };
    };
}

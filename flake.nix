{
  description = "ckgxrg's trivial NixOS packages";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    ags = {
      url = "github:aylur/ags/v3";
      inputs.astal.follows = "astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      ags,
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
      # The packages
      packages.${pkgs.system} = import ./packages/catalog.nix { inherit pkgs ags; };

      devShell.${system} = pkgs.mkShellNoCC {
        name = "ckgpkgs";

        buildInputs = with pkgs; [
          nixfmt-rfc-style
          deadnix
        ];
      };

      # Support nix fmt command
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}

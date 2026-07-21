{
  description = "ckgxrg's miscellaneous Nix packages";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
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
      packages.${system} = import ./packages { inherit pkgs ags; };

      overlays.${system} = import ./overlays;
      overlay-pkgs = import nixpkgs {
        inherit system;
        overlays = self.outputs.overlays.${system}.all;
      };

      devShell.${system} = pkgs.mkShellNoCC {
        name = "ckgpkgs";
      };
    };
}

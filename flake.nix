{
  description = "ckgxrg's trivial NixOS packages";
  inputs = {
    # Nixpkgs source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    {
      nixpkgs,
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
      packages.${pkgs.system} = import ./packages/catalog.nix { inherit pkgs; };

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

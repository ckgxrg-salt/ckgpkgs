{
  description = "ckgxrg's trivial NixOS libraries";
  inputs = {
    # Nixpkgs source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # The packages
      packages.${pkgs.system} = with pkgs; {
        dfl-ipc = qt6Packages.callPackage ./packages/dfl/ipc.nix { };
        dfl-applications = qt6Packages.callPackage ./packages/dfl/applications.nix { };
        dfl-login1 = qt6Packages.callPackage ./packages/dfl/login1.nix { };
        dfl-utils = qt6Packages.callPackage ./packages/dfl/utils.nix { };
        alacritty-themes = callPackage ./packages/theming/alacritty-themes.nix { };
        googledot-cursor = callPackage ./packages/theming/googledot-cursor.nix { };
        nu-scripts = callPackage ./packages/theming/nu-scripts.nix { };
        qtgreet = qt6Packages.callPackage ./packages/qtgreet.nix { };
        sugar-candy-sddm = libsForQt5.callPackage ./packages/theming/sugar-candy-sddm.nix { };
        otto-kvantum = callPackage ./packages/theming/otto-kvantum.nix { };
        otis-gtk = callPackage ./packages/theming/otis-gtk.nix { };
        vivid-icons = callPackage ./packages/theming/vivid-icons.nix { };
        wvkbd-desktop = callPackage ./packages/wvkbd-desktop.nix { };
        fyrox-template = callPackage ./packages/fyrox-template.nix { };
        rofi-themes = callPackage ./packages/theming/rofi-themes.nix { };
        maple-ui = callPackage ./packages/theming/maple-ui.nix { };
      };

      # The system-level modules
      nixosModules = {
        default = self.nixosModules.ckgsys;
        ckgsys = import ./modules/ckgsys.nix;
      };

      # The home-level modules
      homeManagerModules = {
        default = self.homeManagerModules.ckgmods;
        ckgmods = import ./modules/ckgmods.nix;
      };

      # A nix develop shell including formatter and linter to be used with Neovim
      devShell.${system} = pkgs.mkShell {
        name = "ckgpkgs";

        buildInputs = with pkgs; [
          nixfmt-rfc-style
          deadnix
        ];

        shellHook = ''
          exec nu
        '';
      };

      # Support nix fmt command
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}

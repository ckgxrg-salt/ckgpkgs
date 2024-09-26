{
  description = "ckgxrg's trivial Nix packages";
  inputs = {
    # Nixpkgs source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in {
      # The packages
      packages.${pkgs.system} = with pkgs; {
        dfl-ipc = qt6Packages.callPackage ./dfl/ipc.nix { };
        dfl-applications = qt6Packages.callPackage ./dfl/applications.nix { dfl-ipc = self.packages.${pkgs.system}.dfl-ipc; };
        dfl-login1 = qt6Packages.callPackage ./dfl/login1.nix { };
        dfl-utils = qt6Packages.callPackage ./dfl/utils.nix { };
        alacritty-themes = callPackage ./theming/alacritty-themes.nix { };
        googledot-cursor = callPackage ./theming/googledot-cursor.nix { };
        nu-scripts = callPackage ./theming/nu-scripts.nix { };
        qtgreet = qt6Packages.callPackage ./qtgreet.nix { };
        sugar-candy-sddm = callPackage ./theming/sugar-candy-sddm.nix { };
        vivid-icons = callPackage ./theming/vivid-icons.nix { };
        wvkbd-desktop = callPackage ./wvkbd-desktop.nix { };
        bilibili = callPackage ./bilibili.nix { };
      };
    };
}

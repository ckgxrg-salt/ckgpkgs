{
  description = "ckgxrg's trivial Nix packages";
  inputs = {
    # Nixpkgs source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    inputs@{
      nixpkgs,
      ...
    }:
    {
      # The packages
      packages."x86_64-linux" = with nixpkgs.legacyPackages."x86_64-linux"; {
        dfl-applications = (callPackage ./dfl/applications.nix { });
        dfl-ipc = (callPackage ./dfl/ipc.nix { });
        dfl-login1 = (callPackage ./dfl/login1.nix { });
        dfl-utils = (callPackage ./dfl/utils.nix { });
        dfl-wayqt = (callPackage ./dfl/wayqt.nix { });
        alacritty-themes = (callPackage ./theming/alacritty-themes.nix { });
        googledot-cursor = (callPackage ./theming/googledot-cursor.nix { });
        nu-scripts = (callPackage ./theming/nu-scripts.nix { });
        qtgreet = (callPackage ./qtgreet.nix { });
        sugar-candy-sddm = (callPackage ./theming/sugar-candy-sddm.nix { });
        vivid-icons = (callPackage ./theming/vivid-icons.nix { });
        wvkbd-desktop = (callPackage ./wvkbd-desktop.nix { });
      };
    };
}

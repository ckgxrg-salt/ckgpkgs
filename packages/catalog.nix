{ pkgs }:
# All packages
with pkgs;
{
  alacritty-themes = callPackage ./theming/alacritty-themes.nix { };
  googledot-cursor = callPackage ./theming/googledot-cursor.nix { };
  nu-scripts = callPackage ./theming/nu-scripts.nix { };
  vivid-icons = callPackage ./theming/vivid-icons.nix { };
  wvkbd-desktop = callPackage ./wvkbd-desktop.nix { };
  fyrox-template = callPackage ./fyrox-template.nix { };
  rofi-themes = callPackage ./theming/rofi-themes.nix { };
  maple-ui = callPackage ./theming/maple-ui.nix { };

  # GTK & Qt themes
  otis-gtk-theme = callPackage ./theming/otis-gtk.nix { };
  squared-gtk-theme = callPackage ./theming/squared-gtk.nix { };
  space-gtk-theme = callPackage ./theming/space-gtk.nix { };
  marge-kvantum-theme = qt6Packages.callPackage ./theming/marge-kvantum.nix { };

  # My personal packages
  lxwengd = callPackage ./lxwengd.nix { };
}

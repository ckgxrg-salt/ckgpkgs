{ pkgs, ags }:
# All packages
with pkgs;
{
  alacritty-themes = callPackage ./theming/alacritty-themes.nix { };
  googledot-cursor = callPackage ./theming/googledot-cursor.nix { };
  nu-scripts = callPackage ./theming/nu-scripts.nix { };
  vivid-icons = callPackage ./theming/vivid-icons.nix { };
  wvkbd-vistath = callPackage ./wvkbd-vistath.nix { };
  rofi-themes = callPackage ./theming/rofi-themes.nix { };
  maple-ui = callPackage ./theming/maple-ui.nix { };

  # Astal
  astal = {
    daywatch = import ./astal/daywatch.nix { inherit pkgs ags; };
    vistath = import ./astal/vistath.nix { inherit pkgs ags; };
  };

  # GTK & Qt themes
  otis-gtk-theme = callPackage ./theming/otis-gtk.nix { };
  squared-gtk-theme = callPackage ./theming/squared-gtk.nix { };
  space-gtk-theme = callPackage ./theming/space-gtk.nix { };
  marge-kvantum-theme = callPackage ./theming/marge-kvantum.nix { };
  moe-kvantum-theme = callPackage ./theming/moe-kvantum.nix { };

  # Services
  alumnimap = callPackage ./welkin/alumnimap.nix { };
  matrix-qq = callPackage ./welkin/matrix-qq.nix { };
  auto-mcs = callPackage ./welkin/auto-mcs.nix { };

  # Misc
  ch57x-keyboard-tool = callPackage ./ch57x-keyboard-tool.nix { };
  fyrox-template = callPackage ./fyrox-template.nix { };
  lxwengd = callPackage ./lxwengd.nix { };
  show-my-osk = callPackage ./show-my-osk.nix { };
  commet-chat = callPackage ./commet-chat { };
}

{ pkgs, ags }:
# All packages
with pkgs;
{
  alacritty-themes = callPackage ./theming/alacritty-themes.nix { };
  googledot-cursor = callPackage ./theming/googledot-cursor.nix { };
  nu-scripts = callPackage ./theming/nu-scripts.nix { };
  vivid-icons = callPackage ./theming/vivid-icons.nix { };
  wvkbd = callPackage ./wvkbd.nix { };
  rofi-themes = callPackage ./theming/rofi-themes.nix { };

  # Astal
  astal = {
    daywatch = import ./astal/daywatch.nix { inherit pkgs ags; };
    vistath = import ./astal/vistath.nix { inherit pkgs ags; };
    asedia = callPackage ./astal/asedia.nix { inherit ags; };
  };

  # Neovim plugins
  nvim = with pkgs.vimUtils; {
    neovim-tips = callPackage ./neovim/neovim-tips.nix { inherit buildVimPlugin; };
    im-select-nvim = callPackage ./neovim/im-select-nvim.nix { inherit buildVimPlugin; };
    pick-resession-nvim = callPackage ./neovim/pick-resession-nvim.nix { inherit buildVimPlugin; };
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
  postmoogle = callPackage ./welkin/postmoogle.nix { };

  # Misc
  deltapatcher = callPackage ./deltapatcher.nix { };
  ch57x-keyboard-tool = callPackage ./ch57x-keyboard-tool.nix { };
  lxwengd = callPackage ./lxwengd.nix { };
  show-my-osk = callPackage ./show-my-osk.nix { };
  commet-chat = callPackage ./commet-chat { };
}

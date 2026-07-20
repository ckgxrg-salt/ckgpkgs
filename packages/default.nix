{ pkgs, ags, astal }:
# All packages
with pkgs;
{
  # Astal
  astal = {
    daywatch = callPackage ./astal/daywatch.nix { inherit ags; };
  };

  # Neovim plugins
  nvim = with pkgs.vimUtils; {
    neovim-tips = callPackage ./neovim/neovim-tips.nix { inherit buildVimPlugin; };
    im-select-nvim = callPackage ./neovim/im-select-nvim.nix { inherit buildVimPlugin; };
    pick-resession-nvim = callPackage ./neovim/pick-resession-nvim.nix { inherit buildVimPlugin; };
    auto-indent-nvim = callPackage ./neovim/auto-indent-nvim.nix { inherit buildVimPlugin; };
  };

  # Services
  alumnimap = callPackage ./welkin/alumnimap.nix { };
  matrix-qq = callPackage ./welkin/matrix-qq.nix { };
  postmoogle = callPackage ./welkin/postmoogle.nix { };

  # Fonts
  line-seed = callPackage ./fonts/line-seed.nix { };
  agu-display = callPackage ./fonts/agu-display.nix { };
  lxgw-marker-gothic = callPackage ./fonts/lxgw-marker-gothic.nix { };
  offside = callPackage ./fonts/offside.nix { };

  deltapatcher = callPackage ./deltapatcher.nix { };
  lxwengd = callPackage ./lxwengd.nix { };
  show-my-osk = callPackage ./show-my-osk.nix { };
  commet-chat = callPackage ./commet-chat { };
  polycule = callPackage ./polycule { };
  wvkbd = callPackage ./wvkbd.nix { };
  cartridges = callPackage ./cartridges { };
}

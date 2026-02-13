{ pkgs, ags }:
# All packages
with pkgs;
{
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

  # Services
  alumnimap = callPackage ./welkin/alumnimap.nix { };
  matrix-qq = callPackage ./welkin/matrix-qq.nix { };
  postmoogle = callPackage ./welkin/postmoogle.nix { };

  # Misc
  line-seed = callPackage ./line-seed.nix { };
  deltapatcher = callPackage ./deltapatcher.nix { };
  lxwengd = callPackage ./lxwengd.nix { };
  show-my-osk = callPackage ./show-my-osk.nix { };
  commet-chat = callPackage ./commet-chat { };
  polycule = callPackage ./polycule { };
  wvkbd = callPackage ./wvkbd.nix { };
}

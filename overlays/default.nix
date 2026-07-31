rec {
  tuigreet = import ./tuigreet.nix;
  waypaper = import ./waypaper.nix;
  matugen = import ./matugen.nix;
  cartridges = import ./cartridges.nix;
  linux-wallpaperengine = import ./linux-wallpaperengine.nix;
  piper-tts = import ./piper-tts.nix;

  all = [
    tuigreet
    waypaper
    matugen
    cartridges
    linux-wallpaperengine
    piper-tts
  ];
}

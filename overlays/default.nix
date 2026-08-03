rec {
  tuigreet = import ./tuigreet.nix;
  waypaper = import ./waypaper.nix;
  matugen = import ./matugen.nix;
  cartridges = import ./cartridges.nix;
  piper-tts = import ./piper-tts.nix;

  all = [
    tuigreet
    waypaper
    matugen
    cartridges
    piper-tts
  ];
}

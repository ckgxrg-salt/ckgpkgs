rec {
  tuigreet = import ./tuigreet.nix;
  waypaper = import ./waypaper.nix;
  cartridges = import ./cartridges.nix;
  piper-tts = import ./piper-tts.nix;

  all = [
    tuigreet
    waypaper
    cartridges
    piper-tts
  ];
}

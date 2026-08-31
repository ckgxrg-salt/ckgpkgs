rec {
  tuigreet = import ./tuigreet.nix;
  waypaper = import ./waypaper.nix;
  cartridges = import ./cartridges.nix;
  piper-tts = import ./piper-tts.nix;
  deepcool-digital-linux = import ./deepcool-digital-linux.nix;

  all = [
    tuigreet
    waypaper
    cartridges
    piper-tts
    deepcool-digital-linux
  ];
}

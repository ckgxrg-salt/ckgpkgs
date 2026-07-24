rec {
  tuigreet = import ./tuigreet.nix;
  waypaper = import ./waypaper.nix;
  matugen = import ./matugen.nix;

  all = [
    tuigreet
    waypaper
    matugen
  ];
}

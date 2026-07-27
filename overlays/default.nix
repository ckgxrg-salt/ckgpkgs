rec {
  tuigreet = import ./tuigreet.nix;
  waypaper = import ./waypaper.nix;
  matugen = import ./matugen.nix;
  cartridges = import ./cartridges.nix;

  all = [
    tuigreet
    waypaper
    matugen
    cartridges
  ];
}

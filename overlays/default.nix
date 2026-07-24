rec {
  tuigreet = import ./tuigreet.nix;
  waypaper = import ./waypaper.nix;
  matugen = import ./matugen.nix;
  cartridges = import ./cartridges.nix;
  dos2unix = import ./dos2unix.nix;

  all = [
    tuigreet
    waypaper
    matugen
    cartridges
    dos2unix
  ];
}

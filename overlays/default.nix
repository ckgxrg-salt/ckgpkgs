rec {
  tuigreet = import ./tuigreet.nix;
  waypaper = import ./waypaper.nix;

  all = [
    tuigreet
    waypaper
  ];
}

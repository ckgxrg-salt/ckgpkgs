{
  stdenvNoCC,
  fetchFromGitHub,
  wrapGAppsHook,
  gobject-introspection,
  ags,
  glib,
  gjs,
  libgtop,
}:
stdenvNoCC.mkDerivation {
  pname = "asedia-astal";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "asedia-astal";
    rev = "ce5a7cc2066f807a6153cac24651300abe514f5d";
    hash = "sha256-JWkMlY8YT3RXYJwcauO867l+ytCHbkHux9NiYVRG5BY=";
  };

  nativeBuildInputs = [
    wrapGAppsHook
    gobject-introspection
    ags.packages."x86_64-linux".default
  ];

  buildInputs = with ags.packages."x86_64-linux"; [
    glib
    gjs
    libgtop

    io
    astal4
    hyprland
    mpris
    apps
    tray
    battery
  ];

  installPhase = ''
    mkdir -p $out/bin

    ags bundle app.ts $out/bin/astal-shell
    ags bundle logout/app.ts $out/bin/astal-logout
    ags bundle launchpad/app.ts $out/bin/astal-launchpad
  '';
}

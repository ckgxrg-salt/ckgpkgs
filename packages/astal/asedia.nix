{
  stdenvNoCC,
  fetchFromGitHub,
  wrapGAppsHook3,
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
    rev = "a51642e8d7dafb9d328646686d3985c027244786";
    hash = "sha256-AfYDTMv2vmepFh+JBZQ73Bw9HhQ2CcqNQ+5JOVJxXGg=";
  };

  nativeBuildInputs = [
    wrapGAppsHook3
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

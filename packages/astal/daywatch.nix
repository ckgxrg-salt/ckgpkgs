{
  stdenvNoCC,
  fetchFromCodeberg,
  wrapGAppsHook4,
  gobject-introspection,
  ags,
  astal,
  glib,
  gjs,
  libgtop,
}:
stdenvNoCC.mkDerivation rec {
  pname = "daywatch-astal";
  version = "0.1.2";

  src = fetchFromCodeberg {
    owner = "ckgxrg";
    repo = "daywatch-astal";
    rev = "v${version}";
    hash = "sha256-dItnnHSNG2c24j2om7RKxfccJCMNFzDxgeYyx6ckHVM=";
  };

  nativeBuildInputs = [
    wrapGAppsHook4
    gobject-introspection
    ags.packages.${stdenvNoCC.system}.default
  ];

  buildInputs = [
    glib
    gjs
    libgtop

    astal.io
    astal.astal4
    astal.hyprland
    astal.mpris
    astal.apps
    astal.tray
    astal.battery
  ];

  installPhase = ''
    mkdir -p $out/bin

    ags bundle dashboard/app.ts $out/bin/astal-shell
    ags bundle logout/app.ts $out/bin/astal-logout
    ags bundle launchpad/app.ts $out/bin/astal-launchpad
  '';
}

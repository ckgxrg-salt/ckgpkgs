{
  fetchFromGitLab,
  stdenv,
  lib,
  qt6Packages,
  pkg-config,
  meson,
  ninja,
  cmake,
  wrapQtAppsHook,
  qttools,
  qtbase,
  qtwayland,
  wayland,
  mpv,
  pixman,
  wayqt,
  wlroots,
  ...
}:
# The Qt Greeter for Greetd
stdenv.mkDerivation {
  pname = "qtgreet";
  version = "2.0.1";

  nativeBuildInputs = [
    pkg-config
    wrapQtAppsHook
    qttools
    meson
    ninja
    cmake
  ];
  buildInputs = [
    qtbase
    wlroots
    wayqt
    wayland
    (qt6Packages.callPackage ./dfl/ipc.nix { })
    (qt6Packages.callPackage ./dfl/applications.nix { })
    (qt6Packages.callPackage ./dfl/login1.nix { })
    (qt6Packages.callPackage ./dfl/utils.nix { })
    mpv
    pixman
    qtwayland
  ];

  src = fetchFromGitLab {
    owner = "marcusbritanicus";
    repo = "QtGreet";
    rev = "v2.0.1";
    hash = "sha256-Lm7OdB9/o7BltPusuxTIuPQ4w23rCIKugEsjGR5vgVg=";
  };
  mesonFlags = [
    "-Duse_qt_version=qt6"
    "-Dbuild_greetwl=false"
    "-Dnodynpath=true"
  ];

  meta = with lib; {
    description = "Qt based greeter for greetd, to be run under wayfire or similar wlr-based compositors.";
    homepage = "https://gitlab.com/marcusbritanicus/QtGreet";
    maintainers = with maintainers; [ ckgxrg ];
    license = licenses.gpl3Only;
  };
}

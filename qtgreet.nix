{
  fetchFromGitLab,
  clangStdenv,
  pkgs,
  lib,
  ...
}:
# The Qt Greeter for Greetd
clangStdenv.mkDerivation {
  pname = "qtgreet";
  version = "69113e3e";

  nativeBuildInputs = with pkgs; [
    pkg-config
    qt6.wrapQtAppsHook
    meson
    ninja
  ];
  buildInputs = with pkgs; [
    qt6.qtbase
    mpv-unwrapped
    (callPackage ./dfl/login1.nix { })
    (callPackage ./dfl/utils.nix { })
    (callPackage ./dfl/ipc.nix { })
    (callPackage ./dfl/wayqt.nix { })
    (callPackage ./dfl/applications.nix { })
  ];

  src = fetchFromGitLab {
    owner = "marcusbritanicus";
    repo = "QtGreet";
    rev = "69113e3eedd3a01a2452d85effb89379835bca89";
    hash = "sha256-jzeP3iFcdW43N8QL9Y+xJDIE1o0Nv4JuR2HNmH/QV7g=";
  };
  mesonBuildType = "release";
  mesonFlags = [
    "-Duse_qt_version=qt6"
    "-Dbuild_greetwl=false"
    "-Dnodynpath=true"
  ];

  meta = with lib; {
    description = "Qt based greeter for greetd, to be run under wayfire or similar wlr-based compositors.";
    homepage = "https://gitlab.com/marcusbritanicus/QtGreet";
    license = licenses.gpl3Plus;
  };
}

{
  fetchFromGitLab,
  clangStdenv,
  lib,
  qt6Packages,
  pkg-config,
  meson,
  ninja,
  cmake,
  qttools,
  qtbase,
  ...
}:
# Desktop Frameworks: Applications
clangStdenv.mkDerivation {
  pname = "dfl-applications";
  version = "0.2.0";

  dontWrapQtApps = true;
  nativeBuildInputs = [
    pkg-config
    meson
    ninja
    qttools
    cmake
  ];
  buildInputs = [
    qtbase
    (qt6Packages.callPackage ./ipc.nix { })
  ];

  src = fetchFromGitLab {
    owner = "desktop-frameworks";
    repo = "applications";
    rev = "v0.2.0";
    hash = "sha256-Q5xt9M4VoJpd756GiHfbto73y3OuDCjdDSdfCK0mzEk=";
  };
  mesonFlags = [
    "-Duse_qt_version=qt6"
  ];

  meta = with lib; {
    longDescription = ''
      This library provides a thin wrapper around QApplication, QGuiApplication and QCoreApplication, to provide
      single-instance functionality. Further, with the use of DFL::IPC it also provides a smooth two-way communication
      between the first and the subsequent instances.
    '';
    homepage = "https://gitlab.com/desktop-frameworks/applications";
    maintainers = with maintainers; [ ckgxrg ];
    license = licenses.gpl3Only;
  };
}

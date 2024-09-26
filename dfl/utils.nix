{
  fetchFromGitLab,
  clangStdenv,
  lib,
  qttools,
  meson,
  ninja,
  qtbase,
  ...
}:
# Desktop Frameworks: Utils
clangStdenv.mkDerivation {
  pname = "dfl-utils";
  version = "0.2.0";

  dontWrapQtApps = true;
  nativeBuildInputs = [
    qttools
    meson
    ninja
  ];
  buildInputs = [
    qtbase
  ];

  src = fetchFromGitLab {
    owner = "desktop-frameworks";
    repo = "utils";
    rev = "v0.2.0";
    hash = "sha256-IxWYxQP9y51XbZAR+VOex/GYZblAWs8KmoaoFvU0rCY=";
  };
  mesonFlags = [
    "-Duse_qt_version=qt6"
  ];

  meta = with lib; {
    description = "Some utilities for DFL";
    longDescription = ''
      The DesQ library to obtain system information and various classes and functions to be used across the DesQ project.
      This library provides single-instance Application classes for Core and Gui, advanced file-system watcher, a very simple IPC,
      functions to return XDG variables, desktop file parsing, and read various system info like battery, network, storage, cpu
      and RAM info.
    '';
    homepage = "https://gitlab.com/desktop-frameworks/utils";
    maintainers = with maintainers; [ ckgxrg ];
    license = licenses.gpl3Plus;
  };
}

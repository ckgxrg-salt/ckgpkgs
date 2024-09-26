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
# Desktop Frameworks: Logind Interface
clangStdenv.mkDerivation {
  pname = "dfl-login1";
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
    repo = "login1";
    rev = "v0.2.0";
    hash = "sha256-7URHVc0082LuzteSXAK1nE7vcArrsxaHG1LCV/RvTm4=";
  };
  mesonFlags = [
    "-Duse_qt_version=qt6"
  ];

  meta = with lib; {
    description = "DFL Login1 class implements a part of the systemd logind dbus protocol.";
    longDescription = ''DFL Login1 class implements a part of the systemd logind dbus protocol.'';
    homepage = "https://gitlab.com/desktop-frameworks/login1";
    maintainers = with maintainers; [ ckgxrg ];
    license = licenses.gpl3Only;
  };
}

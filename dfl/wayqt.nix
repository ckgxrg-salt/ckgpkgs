{
  fetchFromGitLab,
  clangStdenv,
  pkgs,
  lib,
  ...
}:
# Desktop Frameworks: WayQt
clangStdenv.mkDerivation {
  pname = "dfl-wayqt";
  version = "def4bcb4";

  dontWrapQtApps = true;
  nativeBuildInputs = with pkgs; [
    pkg-config
    meson
    ninja
  ];
  buildInputs = with pkgs; [
    qt6.qtbase
    qt6.qtwayland
    wayland-protocols
  ];

  src = fetchFromGitLab {
    owner = "desktop-frameworks";
    repo = "wayqt";
    rev = "def4bcb404817b588e1c78c330fcd8f8580148e5";
    hash = "sha256-/2if2kjvsXr5KwHSOH4bcrtDjQrdnSfQGWcQh/bEuB8=";
  };
  patchPhase = ''
    substituteInPlace meson.build \
    --replace-fail "QtHeaderPath = ret.stdout().strip()" "QtHeaderPath = '${pkgs.qt6.qtwayland}/include'"
  '';
  mesonBuildType = "release";
  mesonFlags = [
    "-Duse_qt_version=qt6"
  ];

  meta = with lib; {
    description = "A Qt-based wrapper for various wayland protocols.";
    longDescription = ''
      The Qt-based library to handle Wayland and Wlroots protocols to be used with any Qt project.
      Additionally, Wayfire's private protocol as well is supported. As the project develops, support
      for custom protocols may be added.
    '';
    homepage = "https://gitlab.com/desktop-frameworks/wayqt";
    license = licenses.gpl3Plus;
  };
}

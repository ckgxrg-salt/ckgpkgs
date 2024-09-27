{
  fetchFromGitLab,
  clangStdenv,
  lib,
  meson,
  ninja,
  qttools,
  qtbase,
  nlohmann_json,
  ...
}:
# Desktop Frameworks: IPC
clangStdenv.mkDerivation {
  pname = "dfl-ipc";
  version = "0.2.0";

  dontWrapQtApps = true;
  nativeBuildInputs = [
    meson
    ninja
    qttools
  ];
  buildInputs = [
    qtbase
    nlohmann_json
  ];

  src = fetchFromGitLab {
    owner = "desktop-frameworks";
    repo = "ipc";
    rev = "v0.2.0";
    hash = "sha256-MnS/ZswctYl2FennsG1IxZ6s4N/i/LcJGHRuyXqJIM8=";
  };
  mesonFlags = [
    "-Duse_qt_version=qt6"
  ];

  meta = with lib; {
    description = "A very simple set of IPC classes for inter-process communication.";
    longDescription = ''
      Two very simple classes for IPC, especially between two instances of the same application. 
      These classes are used in DFL::Application.
    '';
    homepage = "https://gitlab.com/desktop-frameworks/ipc";
    maintainers = with maintainers; [ ckgxrg ];
    license = licenses.gpl3Only;
  };
}

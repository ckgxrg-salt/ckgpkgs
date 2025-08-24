{
  fetchFromGitHub,
  clangStdenv,
  lib,
  cmake,
  pkg-config,
  gtk3,
}:
clangStdenv.mkDerivation {
  pname = "deltapatcher";
  version = "3.1.6";

  src = fetchFromGitHub {
    owner = "marco-calautti";
    repo = "DeltaPatcher";
    rev = "2fb5830a16d4d0d91177146855000a2987bbc410";
    hash = "sha256-gp31MKin/kQMmXRTQzzBFjAH5WiaOT3VilHL4ceyo6A=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    pkg-config
    cmake
  ];
  buildInputs = [
    gtk3
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DwxBUILD_SHARED=OFF"
  ];

  meta = with lib; {
    homepage = "https://github.com/marco-calautti/DeltaPatcher";
    description = "Delta Patcher is a GUI software that is able to create and apply xdelta patches.";
    platforms = platforms.linux;
    license = licenses.gpl2;
  };
}

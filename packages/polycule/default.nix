{
  lib,
  flutter335,
  fetchFromGitLab,
  cmake,
  libsecret,
  mpv-unwrapped,
  libunwind,
  libdovi,
  libdvdcss,
}:
flutter335.buildFlutterApplication rec {
  pname = "polycule";
  version = "0.3.4";

  src = fetchFromGitLab {
    owner = "polycule_client";
    repo = "polycule";
    rev = "v${version}";
    hash = "sha256-RUu8DKuX2NUU5Ce5WLHtDaORkn7CSrgTj3KhM/z+yHc=";
  };
  strictDeps = true;

  pubspecLock = lib.importJSON ./pubspec.lock.json;

  gitHashes = {
    matrix = "sha256-w/QB5nYJ9Lh77TcYKEN/DnNQjWfp+9NX0dwQ9GOzWE8=";
    media_kit = "sha256-3VtvM6brOhhx/lgPAzPcxe+I6zB0x7UWIhcEmk9krFc=";
    media_kit_libs_android_video = "sha256-nNKVF0kYOfP7ffqa/WPwATjaleB1QaJcT0aFMO7r+90=";
  };

  nativeBuildInput = [
    cmake
  ];
  buildInputs = [
    libsecret
    mpv-unwrapped
    libunwind
    libdovi
    libdvdcss
  ]
  ++ mpv-unwrapped.buildInputs;

  flutterBuildFlags = [
    "--release"
    "--dart-define=POLYCULE_IS_STABLE=true"
    "--dart-define=POLYCULE_VERSION=v${version}"
    "--dart-define=no_default_http_client=true"
  ];

  postInstall = ''
    install -Dm 644 "linux/business.braid.polycule.desktop" "$out/share/applications/business.braid.polycule.desktop"
    install -Dm 644 "linux/business.braid.polycule.metainfo.xml" "$out/share/metainfo/business.braid.polycule.desktop"
    install -Dm 644 "assets/logo/logo-circle.svg" "$out/share/pixmaps/business.braid.polycule.svg"
    install -Dm 644 "assets/logo/logo-circle.svg" "$out/share/icons/hicolor/scalable/apps/business.braid.polycule.svg"
  '';

  meta = with lib; {
    homepage = "https://polycule.im";
    description = "A geeky and efficient [matrix] client for power users.";
    platforms = platforms.linux;
    license = licenses.eupl12;
    mainProgram = "polycule";
  };
}

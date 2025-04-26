{
  lib,
  flutter324,
  fetchFromGitHub,
  libunwind,
  libdovi,
  pkg-config,
  mpv-unwrapped,
}:
flutter324.buildFlutterApplication rec {
  pname = "commet-chat";
  version = "0.3.1+hotfix.1";

  src = fetchFromGitHub {
    owner = "commetchat";
    repo = "commet";
    rev = "v${version}";
    hash = "sha256-FJRmEiov21Sm+OHrJdZ59MHanqq7hxsPBhMFwlEBK50=";
    fetchSubmodules = true;
  };
  strictDeps = true;
  sourceRoot = "${src.name}/commet";

  pubspecLock = lib.importJSON ./pubspec.lock.json;

  gitHashes = {
    dynamic_color = "sha256-4zSTiXplkBjtPtzssj3VaHTVo9YlYKNTMLgBIM5MMe4=";
    flutter_highlighter = "sha256-Y84Besir3gu1RnQt9YoE0GyIJLLZ6H0Kki/Wf6z6QMg=";
    flutter_html = "sha256-6c/8aaQPxNJZI9pDWixnKlWrwRE3zn2e+HMmvahUKbQ=";
    flutter_local_notifications = "sha256-hUKadVrGaU3fY09Uefm7qmkVt1DLaGvvnKtDhpFn1Lk=";
    flutter_shortcuts = "sha256-WxjBK3Pg3plthkzY6hyAvvy8HoHPVmtVQ2Zd7LfjIpM=";
    matrix = "sha256-YKY6JdHbWAc8cxpAkOJEDapO99KP5pWND2UzUFL0O7c=";
    matrix_dart_sdk_drift_db = "sha256-aSOtPGXPsyarK5SB6iwpUpB5jLUS/NAGLNPuiKoya4s=";
    signal_sticker_api = "sha256-kA/yUIGwpPjgVJw1gVaZf4vJwvg0Y1Zl56m+qYdrW3U=";
    starfield = "sha256-ebVRyVkyLfHCC6EBmx5evXL1U71S3tgCMo1yLWlIcw4=";
  };

  nativeBuildInput = [
    pkg-config
  ];
  buildInputs = [
    mpv-unwrapped
    libunwind
    libdovi
  ] ++ mpv-unwrapped.buildInputs;

  # The original codegen.dart hardcodes flutter calls inside, so the patch basically rewrites the codegen script forcing nix.
  patches = [
    ./fix-hardcoded-flutter-cmd.patch
  ];
  preBuild = ''
    packageRun intl_utils -e generate
    dart run --packages=.dart_tool/package_config.json scripts/codegen.dart
    packageRun intl_translation -e generate_from_arb \
      --sources-list-file /build/source/commet/lib/generated/l10n/sources_list_file.txt \
      --translations-list-file /build/source/commet/lib/generated/l10n/arb_list_file.txt \
      --output-dir=lib/generated/l10n

    mkdir -p .dart_tool/flutter_gen
    echo "dependencies:" > .dart_tool/flutter_gen/pubspec.yaml
    packageRun build_runner build
  '';

  flutterBuildFlags = [
    "--release"
    "--dart-define"
    "BUILD_MODE=release"
    "--dart-define"
    "PLATFORM=linux"
  ];

  postInstall = ''
    mkdir -p $out/share/applications
    install -Dm644 \
      linux/debian/usr/share/applications/chat.commet.commetapp.desktop \
      $out/share/applications/
    substituteInPlace $out/share/applications/chat.commet.commetapp.desktop \
      --replace-fail "/usr/lib/chat.commet.commetapp/commet" "commet"

    mkdir -p $out/share/icons
    cp -r linux/debian/usr/share/icons/hicolor $out/share/icons/hicolor
  '';

  meta = with lib; {
    homepage = "https://github.com/commetchat/commet";
    description = "Your space to connect";
    platforms = platforms.linux;
    license = licenses.agpl3Only;
    mainProgram = "commet";
  };
}

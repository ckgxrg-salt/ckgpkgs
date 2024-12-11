{
  fetchFromGitHub,
  flutter324,
  lib,
}:
# A Matrix client
# Still broken
let
  src = fetchFromGitHub {
    owner = "commetchat";
    repo = "commet";
    rev = "7cde152a05b0b604f73835b42022313174c9e222";
    hash = "sha256-PWKPMzbqZIQinKR5LD2ZyeE2TZXPewqkUTFF5ujfFuQ=";
  };
in
flutter324.buildFlutterApplication {
  pname = "commet-chat";
  version = "7cde152";

  inherit src;

  sourceRoot = "./commet";
  autoPubspecLock = src + "/commet/pubspec.lock";
  gitHashes = {
    "dynamic_color" = "sha256-4zSTiXplkBjtPtzssj3VaHTVo9YlYKNTMLgBIM5MMe4=";
    "encrypted_url_preview" = "sha256-UoqohRdgElmrVXCJqENrT1W1OVlS1KqWhtG1aqDFYlk=";
    "flutter_highlighter" = "sha256-Y84Besir3gu1RnQt9YoE0GyIJLLZ6H0Kki/Wf6z6QMg=";
    "flutter_html" = "sha256-6c/8aaQPxNJZI9pDWixnKlWrwRE3zn2e+HMmvahUKbQ=";
    "flutter_local_notifications" = "sha256-hUKadVrGaU3fY09Uefm7qmkVt1DLaGvvnKtDhpFn1Lk=";
    "flutter_shortcuts" = "sha256-WxjBK3Pg3plthkzY6hyAvvy8HoHPVmtVQ2Zd7LfjIpM=";
    "matrix" = "sha256-YKY6JdHbWAc8cxpAkOJEDapO99KP5pWND2UzUFL0O7c=";
    "matrix_dart_sdk_drift_db" = "sha256-5OLldXLZ42oesB6cxGWRT7eoOORicYW2+hc/NZc1xE8=";
    "media_kit" = "";
    "media_kit_libs_android_video" = "";
    "media_kit_libs_ios_video" = "";
    "media_kit_libs_linux" = "";
    "media_kit_libs_macos_video" = "";
    "media_kit_libs_video" = "";
    "media_kit_libs_windows_video" = "";
    "media_kit_native_event_loop" = "";
    "media_kit_video" = "";
    "signal_sticker_api" = "sha256-kA/yUIGwpPjgVJw1gVaZf4vJwvg0Y1Zl56m+qYdrW3U=";
  };

  preBuild = ''
    dart run scripts/codegen.dart
  '';

  flutterBuildFlags = lib.traceValSeq (
    lib.mapAttrsToList (n: v: "--dart-define ${n}=${v}") {
      PLATFORM = "linux";
      BUILD_MODE = "release";
      BUILD_DETAIL = "NixOS";
    }
  );
}

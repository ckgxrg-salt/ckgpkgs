{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "clashtui";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "JohanChane";
    repo = "clashtui";
    tag = "v${finalAttrs.version}";
    hash = "sha256-roP252d0lO7eN2KCHiuPPI5o8QqtPWJvmeex8sAmKww=";
  };
  cargoHash = "sha256-7y31iZoSJ98XDiC+Akahgfp/lI5haaek6UpFtaCtGW8=";

  cargoBuildFlags = [ "--all-features" ];

  checkFlags = [
    "--skip=utils::config::test::test_save_and_load"
  ];

  meta = {
    description = "Mihomo (Clash.Meta) TUI Client";
    homepage = "https://github.com/JohanChane/clashtui";
    mainProgram = "clashtui";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
})

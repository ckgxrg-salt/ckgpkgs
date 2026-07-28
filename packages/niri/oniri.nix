{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "oniri";
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "Antiz96";
    repo = "oniri";
    tag = "v${finalAttrs.version}";
    hash = "sha256-XQyzoQ/s6ROj+GKwpZM2rZHl9niE/6IWBcE2lgJ8KR8=";
  };
  cargoHash = "sha256-mDS5kyBYjzn31gekqrH8zm2fLzBSFDXODxjGqszoWcE=";

  meta = {
    homepage = "https://github.com/Antiz96/oniri";
    description = "A tool that automatically maximizes the only window of a niri workspace (with optional tiling layout mode)";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ ckgxrg ];
    mainProgram = "oniri";
  };
})

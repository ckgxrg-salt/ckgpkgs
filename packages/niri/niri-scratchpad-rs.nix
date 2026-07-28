{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "niri-scratchpad-rs";
  version = "2.1";

  src = fetchFromGitHub {
    owner = "argosnothing";
    repo = "niri-scratchpad-rs";
    tag = finalAttrs.version;
    hash = "sha256-GbyUJKotb1Ig56laVUYUeEtTnBE7cSx/Mcdr4K7oJkk=";
  };
  cargoHash = "sha256-XeXNJOsc/5oeS91NOxM1eFn5cfUOFdTjeDmB5+4VIiQ=";

  meta = {
    homepage = "https://github.com/argosnothing/niri-scratchpad-rs";
    description = "Dynamic & Static Scratchpad Management for Niri";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ckgxrg ];
    mainProgram = "niri-scratchpad-rs";
  };
})

{
  stdenvNoCC,
  fetchFromGitHub,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "offside";
  version = "2023-2-3";

  src = fetchFromGitHub {
    owner = "etunni";
    repo = "offside";
    rev = "master";
    hash = "sha256-4rbMSFQ348ftlLytAmmeBnyBe9LqSoFxjFK8ic8relE=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/opentype

    install -Dm644 fonts/otf/Offside-Regular.otf $out/share/fonts/opentype
  '';

  meta = {
    homepage = "https://github.com/etunni/offside";
    description = "Libre font";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ ckgxrg ];
  };
}

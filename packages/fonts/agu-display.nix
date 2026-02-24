{
  stdenvNoCC,
  fetchzip,
  lib,
}:
stdenvNoCC.mkDerivation rec {
  pname = "agu-display";
  version = "1.05";

  srcs = fetchzip {
    url = "https://github.com/theseunbadejo/Agu-Display/releases/download/${version}/Agu-Display-${version}.zip";
    hash = "sha256-Q6twA3rkSYmG6CSEB1xTTzyD4R/FXZUKt0jeifFzI5E=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/opentype

    install -Dm644 fonts/otf/AguDisplay-Ala.otf $out/share/fonts/opentype
    install -Dm644 fonts/otf/AguDisplay-Osisi.otf $out/share/fonts/opentype
    install -Dm644 fonts/otf/AguDisplay-Uzo.otf $out/share/fonts/opentype
  '';

  meta = with lib; {
    homepage = "https://agudisplay.com/";
    description = "Agụ Display is a decorative, rounded, sans-serif display typeface featuring a substitution axis that makes the letters dance.";
    license = licenses.ofl;
    maintainers = with maintainers; [ ckgxrg ];
  };
}

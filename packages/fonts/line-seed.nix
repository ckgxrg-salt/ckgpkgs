{
  stdenvNoCC,
  fetchzip,
  lib,
}:
let
  en = fetchzip {
    url = "https://seed.line.me/src/images/fonts/LINE_Seed_Sans_EN.zip";
    name = "LINE_Seed_Sans_EN";
    hash = "sha256-hRCoKUPklbfsVhdrpnEzzesZ4LatQyAYnKGNGmfI9d0=";
  };
  jp = fetchzip {
    url = "https://seed.line.me/src/images/fonts/LINE_Seed_JP.zip";
    name = "LINE_Seed_JP";
    hash = "sha256-zLEUl9EpiXT9iZDSN3gH8spLrQwWWPxSX35+ZRtGxA8=";
  };

in
stdenvNoCC.mkDerivation {
  pname = "line-seed";
  version = "1.003";

  srcs = [
    en
    jp
  ];
  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/share/fonts/opentype

    install -Dm644 ${en}/Desktop/OTF/LINESeedSans_Bd.otf $out/share/fonts/opentype
    install -Dm644 ${en}/Desktop/OTF/LINESeedSans_He.otf $out/share/fonts/opentype
    install -Dm644 ${en}/Desktop/OTF/LINESeedSans_Rg.otf $out/share/fonts/opentype
    install -Dm644 ${en}/Desktop/OTF/LINESeedSans_Th.otf $out/share/fonts/opentype
    install -Dm644 ${en}/Desktop/OTF/LINESeedSans_XBd.otf $out/share/fonts/opentype

    install -Dm644 ${jp}/Desktop/OTF/LINESeedJP_OTF_Bd.otf $out/share/fonts/opentype
    install -Dm644 ${jp}/Desktop/OTF/LINESeedJP_OTF_Eb.otf $out/share/fonts/opentype
    install -Dm644 ${jp}/Desktop/OTF/LINESeedJP_OTF_Rg.otf $out/share/fonts/opentype
    install -Dm644 ${jp}/Desktop/OTF/LINESeedJP_OTF_Th.otf $out/share/fonts/opentype
  '';

  meta = with lib; {
    homepage = "https://seed.line.me";
    description = "Seed, a word containing the meaning of growth, is LINE’s first custom typeface.";
    license = licenses.ofl;
    maintainers = with maintainers; [ ckgxrg ];
  };
}

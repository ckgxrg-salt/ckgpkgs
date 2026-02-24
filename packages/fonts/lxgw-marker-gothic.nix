{
  stdenvNoCC,
  fetchzip,
  lib,
}:
stdenvNoCC.mkDerivation rec {
  pname = "lxgw-marker-gothic";
  version = "1.003";

  src = fetchzip {
    url = "https://github.com/lxgw/LxgwMarkerGothic/releases/download/v${version}/LxgwMarkerGothic-v${version}.zip";
    hash = "sha256-tkA3yjRHJqfudbgx0EXBPhXkxS0qbijojI24rLbXV+o=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype

    install -Dm644 fonts/ttf/LXGWMarkerGothic-Regular.ttf $out/share/fonts/truetype
  '';

  meta = {
    homepage = "https://lxgw.github.io/";
    description = "An open-source Chinese font derived from Tanugo";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ ckgxrg ];
  };
}

{ stdenvNoCC, fetchzip }:
stdenvNoCC.mkDerivation rec {
  pname = "auto-mcs";
  version = "2.3.1";

  src = fetchzip {
    url = "https://github.com/macarooni-man/auto-mcs/releases/download/v${version}/auto-mcs-linux-${version}.zip";
    hash = "sha256-xP4a6aFEkEZVSRrZJg9fHYtMa3dFqvGXmxMSoJGiitA=";
  };

  dontBuild = true;
  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 auto-mcs "$out/bin/auto-mcs"
  '';
}

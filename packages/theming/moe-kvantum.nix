{
  fetchFromGitLab,
  stdenvNoCC,
  jdupes,
}:
# Moe Kvantum theme
stdenvNoCC.mkDerivation {
  pname = "moe-kvantum-theme";
  version = "1e9dcd6d";

  dontBuild = true;
  nativeBuildInputs = [ jdupes ];

  src = fetchFromGitLab {
    owner = "jomada";
    repo = "moe-dark";
    rev = "1e9dcd6d89a58f1de61e13cc361f563e01dd1c26";
    hash = "sha256-bQMbOKsHsaoEC4UJ5aIYD+D/GGkEAd7txYG8+VdaTV8=";
  };
  installPhase = ''
    mkdir -p $out/share
    mv * $out/share
    mv $out/share/kvantum $out/share/Kvantum
    jdupes --quiet --link-soft --recurse $out/share
  '';
}

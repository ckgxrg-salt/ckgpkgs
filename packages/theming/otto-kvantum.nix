{
  fetchFromGitLab,
  stdenvNoCC,
  jdupes
}:
# The Otto Kvantum theme
stdenvNoCC.mkDerivation {
  pname = "otto-kvantum-theme";
  version = "e49204ff";

  dontBuild = true;
  nativeBuildInputs = [ jdupes ];

  src = fetchFromGitLab {
    owner = "jomada";
    repo = "otto";
    rev = "e49204ff6eadf299cdaae88e28e09d94e66a79f5";
    hash = "sha256-Eo9Z/Lhgo6PyXl4rDYs5xeq9WJPe2rV3DwultBzMHAg=";
  };
  installPhase = ''
    mv kvantum Kvantum
    mkdir -p $out/share
    mv * $out/share
    jdupes --quiet --link-soft --recurse $out/share
  '';
}

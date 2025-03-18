{
  fetchFromGitHub,
  rustPlatform,
  lib,
}:
# LxWEngD
rustPlatform.buildRustPackage {
  pname = "lxwengd";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "LxWEngD";
    rev = "3f5d315f45f2e85713571f70a413a5c97bf1f14f";
    hash = "sha256-3kBG15g96z+whx1TLofHu5m1Eqdja8dF4UP5weVnqiE=";
  };
  cargoHash = "sha256-KClloDrShUiYjMkDljPYknJ9uGi0nu9nIXZ5vPwrrmc=";
  useFetchCargoVendor = true;

  meta = {
    description = "A daemon that adds playlists to linux-wallpaperengine";
    homepage = "https://github.com/ckgxrg-salt/LxWEngD";
    license = lib.licenses.bsd2;
    maintainers = [ lib.maintainers.ckgxrg ];
  };
}

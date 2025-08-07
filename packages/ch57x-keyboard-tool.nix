{ rustPlatform, fetchCrate }:
# Driver for mini keyboard
rustPlatform.buildRustPackage rec {
  pname = "ch57x-keyboard-tool";
  version = "1.5.2";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-HldGw7m32PZUuDQIpYCdauk6B75sD0S5I8NNbpT7X4A=";
  };
  cargoHash = "sha256-/I77kgC596jE6PDGzF1MjD6tyj880hcHEL4HSuFHaew=";
}

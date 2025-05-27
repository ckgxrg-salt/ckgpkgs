{
  rustPlatform,
  fetchFromGitHub,
  lib,
  trunk,
  wasm-bindgen-cli,
  binaryen,
  llvmPackages,
  ...
}:
rustPlatform.buildRustPackage {
  pname = "alumnimap";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "AlumniMap";
    rev = "ea45d3e0188305b080eeac4d1c7926802ad64ef3";
    hash = "sha256-fbGH0K1uf9Y67qmh0aaFuFDvXiAq8W0WZC+C6hesz70=";
  };
  cargoHash = "sha256-0cGdMtdlPHFyU9V3FC8t4cJemD1Q58VfU3LjDg6fLRU=";

  nativeBuildInputs = [
    trunk
    binaryen
    wasm-bindgen-cli
    llvmPackages.bintools
  ];

  dontUseCargoBuild = true;
  buildPhase = ''
    export HOME=$(mktemp -d)
    mkdir -p $HOME/.cargo $HOME/.cache
    export CARGO_HOME=$HOME/.cargo
    export TRUNK_CACHE=$HOME/.cache/trunk

    cd frontend
    trunk build --offline --release
    cd ..

    cargo build --bin alumnimap --release
  '';
  checkPhase = ''
    cargo check --package entity
    cargo check --package migration
    cargo check --package backend
    cargo check --target wasm32-unknown-unknown --package frontend
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp target/release/alumnimap $out/bin
  '';

  meta = {
    description = "See where our classmates will be going";
    homepage = "https://github.com/ckgxrg-salt/AlumniMap";
    license = lib.licenses.gpl3Only;
    maintainers = [ lib.maintainers.ckgxrg ];
  };
}

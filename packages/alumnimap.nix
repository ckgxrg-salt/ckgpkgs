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
rustPlatform.buildRustPackage rec {
  pname = "alumnimap";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "AlumniMap";
    rev = version;
    hash = "sha256-zgft9vosPVrFN9lOEKBxjRFtrhdD20utDEIMbKzcT4A=";
  };
  cargoHash = "sha256-mqB4teLIDCn8cTO17IEQ9bJ+cwDytiXXFmq2qUadi+A=";

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

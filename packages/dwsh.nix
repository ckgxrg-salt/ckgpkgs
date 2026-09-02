{
  rustPlatform,
  fetchFromCodeberg,
  lib,
  pkg-config,
  pango,
  librsvg,
  gtk4,
  gtk4-layer-shell,
}:
rustPlatform.buildRustPackage {
  pname = "dwsh";
  version = "0.0.1";

  src = fetchFromCodeberg {
    owner = "ckgxrg";
    repo = "dwsh";
    rev = "main";
    hash = "sha256-7hm32m0w62t6iqhRwT4Et0WB4uXwdy9Hiz9BO1GACq4=";
  };
  cargoHash = "sha256-Nod9I++aEOHNY6pHlmngu62dW9Ps1RDe8M8/oLO0tbQ=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    pango
    librsvg
    gtk4
    gtk4-layer-shell
  ];

  meta = {
    description = "A desktop shell for my laptop";
    homepage = "https://codeberg.org/ckgxrg/dwsh";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ ckgxrg ];
  };
}

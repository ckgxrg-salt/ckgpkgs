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
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "dwsh";
  version = "0.0.2";

  src = fetchFromCodeberg {
    owner = "ckgxrg";
    repo = "dwsh";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NM1ja57g3QX+ONBzP5udkFePyyDq8xeBcvVqEzZLt0Y=";
  };
  cargoHash = "sha256-jf2t5j892vF7Fkrvw2KyfF5RphhJndixb0twMnR9Vzk=";

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
})

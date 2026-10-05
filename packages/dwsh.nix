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
  version = "0.0.1";

  src = fetchFromCodeberg {
    owner = "ckgxrg";
    repo = "dwsh";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8d3EgPHbGS5E3KxnZM6uYTWVHHWo9mJTlVlCvpCw318=";
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

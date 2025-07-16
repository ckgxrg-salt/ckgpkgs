{
  fetchFromGitHub,
  clangStdenv,
  lib,
  wayland-scanner,
  wayland,
  pango,
  glib,
  harfbuzz,
  cairo,
  pkg-config,
  libxkbcommon,
  scdoc,
  layout ? "vistath",
}:

clangStdenv.mkDerivation {
  pname = "wvkbd";
  version = "0.16";

  src = fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "wvkbd";
    rev = "82fdf86acec6d8d9b124c3098f4e0da9fa0b4751";
    hash = "sha256-TeMAmr7KnU3EtQ2yjuAurTGePxthgKcD86h9G8YTaxs=";
  };

  postPatch = ''
    substituteInPlace Makefile \
      --replace-fail "pkg-config" "$PKG_CONFIG"
  '';

  nativeBuildInputs = [
    pkg-config
    scdoc
    wayland-scanner
  ];
  buildInputs = [
    cairo
    glib
    harfbuzz
    libxkbcommon
    pango
    wayland
  ];
  installFlags = [ "PREFIX=$(out)" ];
  makeFlags = [ "LAYOUT=${layout}" ];

  strictDeps = true;

  meta = with lib; {
    homepage = "https://github.com/ckgxrg-salt/wvkbd";
    description = "On-screen keyboard for wlroots";
    platforms = platforms.linux;
    license = licenses.gpl3Plus;
    mainProgram = "wvkbd-vistath";
  };
}

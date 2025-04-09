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
  version = "57d1de7";

  src = fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "wvkbd";
    rev = "57d1de7a8d38737bd6ab6089f5ff5f67d840f3ef";
    hash = "sha256-3mGEsXEpYLtDnn5aBMVtzFygKrqFUFubXqiJ2NkldTw=";
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

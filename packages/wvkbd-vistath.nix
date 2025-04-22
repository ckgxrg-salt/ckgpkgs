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
    rev = "a15512147b2c8ad978437b25aab7d488575eb7d1";
    hash = "sha256-f5x3OoHIDj7iGExOoXtpzfyzqZOjwNe/C0mqUfALZ6o=";
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

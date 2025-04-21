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
    rev = "f487f6696de47adef277b1971ee196debc3a0292";
    hash = "sha256-8sul4vDAp0O/kb51nqr654rXY0gc+P5LAxxw9sUF3hg=";
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

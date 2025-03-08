{
  fetchFromGitHub,
  stdenvNoCC,
  jdupes,
}:
# Space GTK theme
stdenvNoCC.mkDerivation {
  pname = "space-gtk-theme";
  version = "528e4c3";

  dontBuild = true;
  src = fetchFromGitHub {
    owner = "EliverLara";
    repo = "Space";
    rev = "528e4c33f74822242e404e46a61e919f994a3396";
    hash = "sha256-StZdKjrFaCxwdvV39mxeFMX1msweqAyxSr4AL2ocTLI=";
  };

  nativeBuildInputs = [ jdupes ];
  installPhase = ''
    mkdir -p $out/share/themes/Space
    mv * $out/share/themes/Space

    rm -r $out/share/themes/Space/Art
    rm -r $out/share/themes/Space/LICENSE
    rm -r $out/share/themes/Space/README.md
    rm -r $out/share/themes/Space/{package.json,package-lock.json,Gulpfile.js}
    rm -r $out/share/themes/Space/src
    rm -r $out/share/themes/Space/cinnamon/*.scss
    rm -r $out/share/themes/Space/gnome-shell/{extensions,*.scss}
    rm -r $out/share/themes/Space/xfwm4/{assets,render_assets.fish}

    jdupes --quiet --link-soft --recurse $out/share
  '';
}

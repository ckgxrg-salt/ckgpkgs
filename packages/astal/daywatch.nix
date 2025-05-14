{
  pkgs,
  ags,
}:
ags.lib.bundle {
  inherit pkgs;
  name = "daywatch-astal";
  entry = "app.ts";
  gtk4 = false;

  src = pkgs.fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "daywatch-astal";
    rev = "5d38a1bf96e9348015bb6f78abba56bd7a4e0a50";
    hash = "sha256-wd4SHzwqerZsD8lpaEQE5p4v7wA2iQZSGPbISbZyr64=";
  };

  extraPackages = with ags.packages.${pkgs.system}; [
    astal3
    io
    hyprland
    tray
    mpris
    wireplumber
    battery
    pkgs.libgtop
  ];
}

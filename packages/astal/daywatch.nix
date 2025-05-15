{
  pkgs,
  ags,
}:
ags.lib.bundle {
  inherit pkgs;
  name = "astal";
  entry = "app.ts";
  gtk4 = false;

  src = pkgs.fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "daywatch-astal";
    rev = "83e8149b37cf550ec7ebc78974d2a613968de35e";
    hash = "sha256-NCwQOEvq5KY1ybFCTjdSt6QgyEhc08CaHMCkGXE+t5g=";
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

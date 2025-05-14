{
  pkgs,
  ags,
}:
ags.lib.bundle {
  inherit pkgs;
  name = "astal-logout";
  entry = "logout/logout.ts";
  gtk4 = false;

  src = pkgs.fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "vistath-astal";
    rev = "ec00b7acddee7231731b266ddce51d924aa3d2cb";
    hash = "sha256-f/FxKmpwvcOtZOGRyYJyy6M6qPKXzbTgTgehMeol1dY=";
  };

  extraPackages = with ags.packages.${pkgs.system}; [
    astal3
    io
    hyprland
  ];
}

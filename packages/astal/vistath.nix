{
  pkgs,
  ags,
}:
let
  src = pkgs.fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "vistath-astal";
    rev = "f950ae27d60bfb05cf2c6317451f29fe369659c1";
    hash = "sha256-+w8E9nhkNKvoCSTeFJGBmbXRDfM4NaTUtJkr845XDk8=";
  };
in
{
  main = ags.lib.bundle {
    inherit pkgs src;
    name = "astal";
    entry = "app.ts";
    gtk4 = false;

    extraPackages = with ags.packages.${pkgs.system}; [
      astal3
      io
      apps
      hyprland
      tray
      mpris
      wireplumber
      battery
      pkgs.libgtop
    ];
  };

  logout = ags.lib.bundle {
    inherit pkgs src;
    name = "astal-logout";
    entry = "logout/logout.ts";
    gtk4 = false;

    extraPackages = with ags.packages.${pkgs.system}; [
      astal3
      io
      hyprland
    ];
  };
}

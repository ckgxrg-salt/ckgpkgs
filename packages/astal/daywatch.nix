{
  pkgs,
  ags,
}:
let
  src = pkgs.fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "daywatch-astal";
    rev = "6b3ce28618755a0fc777a1035a56f45ed2d56db1";
    hash = "sha256-gc+hFQICGjtzqE68XNnFT2JUbNC9aG/XV++3cbzloaA=";
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

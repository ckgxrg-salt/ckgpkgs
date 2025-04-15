{
  fetchFromGitHub,
  lib,
  hyprland,
  hyprlandPlugins,
}:
hyprlandPlugins.mkHyprlandPlugin hyprland {
  pluginName = "show-my-osk";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "ShowMyOSK";
    rev = "7f0687f1d1e8851898c16971cf8061ef586853cf";
    hash = "sha256-rzud5hucG3LmRABU5/fMoy1dgx+zWykRULSvoPrT0OE=";
  };

  inherit (hyprland) nativeBuildInputs;

  meta = with lib; {
    homepage = "https://github.com/ckgxrg-salt/ShowMyOSK";
    description = "Automatically pops up on-screen keyboard when an input field is focused for Hyprland.";
    license = licenses.bsd2;
    platforms = platforms.linux;
  };
}

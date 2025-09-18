{
  fetchFromGitHub,
  lib,
  hyprlandPlugins,
  meson,
  ninja,
}:
hyprlandPlugins.mkHyprlandPlugin {
  pluginName = "show-my-osk";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "ckgxrg-salt";
    repo = "show-my-osk";
    rev = "bd6a59ca000121781e44446666693c99060ee03b";
    hash = "sha256-q+sathe7UInyCi0ROBLbymO3Mq1EcfStwL82MurKywk=";
  };

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = with lib; {
    homepage = "https://github.com/ckgxrg-salt/show-my-osk";
    description = "A Hyprland plugin that automatically pops up on-screen keyboard upon focusing an input field.";
    license = licenses.bsd2;
    platforms = platforms.linux;
  };
}

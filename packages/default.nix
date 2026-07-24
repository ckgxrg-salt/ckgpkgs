{
  pkgs,
  ags,
}:
# All packages
with pkgs;
rec {
  # Astal
  astal = {
    daywatch = callPackage ./astal/daywatch.nix { inherit ags; };
  };

  # Services
  alumnimap = callPackage ./welkin/alumnimap.nix { };
  matrix-qq = callPackage ./welkin/matrix-qq.nix { };
  postmoogle = callPackage ./welkin/postmoogle.nix { };

  # Python
  ko-speech-tools = python313Packages.callPackage ./python/ko-speech-tools.nix { };
  coqui-tts = python313Packages.callPackage ./python/coqui-tts.nix { inherit ko-speech-tools; };

  # Fonts
  line-seed = callPackage ./fonts/line-seed.nix { };
  agu-display = callPackage ./fonts/agu-display.nix { };
  lxgw-marker-gothic = callPackage ./fonts/lxgw-marker-gothic.nix { };
  offside = callPackage ./fonts/offside.nix { };

  # Misc
  deltapatcher = callPackage ./deltapatcher.nix { };
  lxwengd = callPackage ./lxwengd.nix { };
  show-my-osk = callPackage ./show-my-osk.nix { };
  commet-chat = callPackage ./commet-chat { };
  polycule = callPackage ./polycule { };
  wvkbd = callPackage ./wvkbd.nix { };
}

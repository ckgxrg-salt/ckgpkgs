final: prev: {
  deepcool-digital-linux = prev.deepcool-digital-linux.overrideAttrs (
    finalAttrs: prevAttrs: {
      version = "0.10.6-alpha";

      src = final.fetchFromGitHub {
        inherit (prevAttrs.src) owner repo;
        tag = "v${finalAttrs.version}";
        hash = "sha256-aY4bzsmUaVM87d0n74vwfWOJMi/qtD04uklG+mPeN3U=";
      };

      cargoDeps = final.rustPlatform.fetchCargoVendor {
        inherit (finalAttrs) src;
        hash = "sha256-5/DjqmDVCqlL+jwGeBor+ha/gs6qLeCbbaG4a9Ac6cs=";
      };
    }
  );
}

final: prev: {
  tuigreet = prev.tuigreet.overrideAttrs (
    finalAttrs: prevAttrs: {
      version = "0.10.2";

      src = final.fetchFromGitHub {
        inherit (prevAttrs.src) repo;
        owner = "NotAShelf";
        tag = finalAttrs.version;
        hash = "sha256-4DB4Pl2UwIeab/MJaX3VfVNMsPWE6Q513z1NDdxvG3o=";
      };

      cargoDeps = final.rustPlatform.fetchCargoVendor {
        inherit (finalAttrs) src;
        hash = "sha256-5Q4E8nnmQ109gcfxxctn/rne5N4Qvz2Pft6o7as2fSc=";
      };
    }
  );
}

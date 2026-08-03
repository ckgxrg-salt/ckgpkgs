final: prev: {
  tuigreet = prev.tuigreet.overrideAttrs (
    finalAttrs: prevAttrs: {
      version = "0.10.2";

      src = final.fetchFromGitHub {
        inherit (prevAttrs.src) repo;
        owner = "NotAShelf";
        tag = finalAttrs.version;
        hash = "sha256-jeelrp9r/V8540qKoCofD8wz/w/qBcubs72HkremhME=";
      };

      cargoDeps = final.rustPlatform.fetchCargoVendor {
        inherit (finalAttrs) src;
        hash = "sha256-B5Qxwv8jdpGJwXTEm5c12kvb6fri7H1AL2w640xQXVQ=";
      };
    }
  );
}

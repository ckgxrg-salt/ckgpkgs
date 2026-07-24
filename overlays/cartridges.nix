final: prev: {
  cartridges = prev.cartridges.overrideAttrs (
    finalAttrs: prevAttrs: {
      version = "2.13.1";

      src = final.fetchFromGitHub {
        inherit (prevAttrs.src) owner repo;
        tag = "v${finalAttrs.version}";
        hash = "sha256-VWOKsSOEAtngrDx7tJ+notoMBfBuO40Z2x9VTj710+8=";
      };

      patches = [
        ./cast-number-to-string.patch
      ];
    }
  );
}

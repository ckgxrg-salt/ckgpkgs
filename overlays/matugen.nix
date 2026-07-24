final: prev: {
  matugen = prev.matugen.overrideAttrs (
    finalAttrs: prevAttrs: {
      version = "8bd2f68";

      src = final.fetchFromGitHub {
        inherit (prevAttrs.src) owner repo;
        rev = "8bd2f68372259c1133cd1bb449a89804956fcab6";
        hash = "sha256-kMk+ieiUNkx4s/URivt25/b3W9TCIB7ddp/gg4vCjIs=";
      };

      cargoDeps = final.rustPlatform.fetchCargoVendor {
        inherit (finalAttrs) src;
        hash = "sha256-bfvlPiTlPQeedo+ikHXSI8NqdA5R5M7gCsgx7srYsMQ=";
      };
    }
  );
}

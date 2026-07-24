final: prev: {
  dos2unix = prev.dos2unix.overrideAttrs (
    finalAttrs: _: {
      version = "7.5.6";

      src = final.fetchurl {
        url = "https://waterlander.net/dos2unix/files/dos2unix-${finalAttrs.version}.tar.gz";
        hash = "sha256-Y2UKy9DH+oYjQpvL+TqIjjNRocrQ9VbPQYdvVnPdfQs=";
      };

      outputs = [
        "out"
        "doc"
        "man"
      ];

      strictDeps = true;
      __structuredAttrs = true;
      enableParallelBuilding = true;
    }
  );
}

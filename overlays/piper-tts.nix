final: prev: {
  piper-tts = prev.piper-tts.overrideAttrs (
    finalAttrs: prevAttrs: {
      version = "1.6.0";

      src = final.fetchFromGitHub {
        inherit (prevAttrs.src) owner repo;
        tag = "v${finalAttrs.version}";
        hash = "sha256-QY9/KDLtamGMbAp8FXvN8emreL8leXJiL0PbgOTNjCU=";
      };

      patches = [
        ./cmake-system-libs.patch
      ];
    }
  );
}

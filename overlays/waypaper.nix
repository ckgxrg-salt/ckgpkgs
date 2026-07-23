final: prev: {
  waypaper = prev.waypaper.overrideAttrs (
    finalAttrs: prevAttrs: {
      version = "2.8";

      src = final.fetchFromGitHub {
        inherit (prevAttrs.src) owner repo;
        tag = finalAttrs.version;
        hash = "sha256-BTbpl7h/VG+yD7Uo+088j3CLwhhYacABlSyKajI+o3U=";
      };
    }
  );
}

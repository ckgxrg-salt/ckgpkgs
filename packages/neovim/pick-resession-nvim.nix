{
  buildVimPlugin,
  fetchurl,
  lib,
}:
buildVimPlugin rec {
  pname = "pick-resession.nvim";
  version = "1.1.0";
  src = fetchurl {
    url = "https://github.com/scottmckendry/pick-resession.nvim/archive/v${version}.tar.gz";
    sha256 = "sha256-RpY5wVUyPayz7+PlaD3aCO5bAcv2O1NqHCjrGFoN+AQ=";
  };
  meta = {
    homepage = "https://github.com/scottmckendry/pick-resession.nvim";
    description = "Telescope & Snacks pickers for resession.nvim ";
    maintainers = with lib.maintainers; [ ckgxrg ];
    license = lib.licenses.mit;
  };
}

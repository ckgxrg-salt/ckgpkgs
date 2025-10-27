{
  buildVimPlugin,
  fetchurl,
  lib,
}:
buildVimPlugin {
  pname = "im-select.nvim";
  version = "2025-07-24";
  src = fetchurl {
    url = "https://github.com/keaising/im-select.nvim/archive/113a6905a1c95d2990269f96abcbad9718209557.tar.gz";
    sha256 = "sha256-mGSes8U+p2Ct1gYjOuRHfl76v4S42StVSyaixq4YRas=";
  };
  meta = {
    homepage = "https://github.com/keaising/im-select.nvim";
    description = "Switch Input Method automatically depends on Neovim's edit mode";
    maintainers = with lib.maintainers; [ ckgxrg ];
    license = lib.licenses.mit;
  };
}

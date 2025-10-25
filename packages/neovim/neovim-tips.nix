{
  buildVimPlugin,
  fetchurl,
  lib,
}:
buildVimPlugin rec {
  pname = "neovim-tips";
  version = "0.7.0";
  src = fetchurl {
    url = "https://github.com/saxon1964/neovim-tips/archive/v${version}.tar.gz";
    sha256 = "sha256-TyykqDpSwcOe1E6I9oW7/mdTTkYNbcq0kuzo9Is1NY4=";
  };
  meta = {
    homepage = "https://github.com/saxon1964/neovim-tips";
    description = "Discover hundreds of Neovim tips, tricks, and shortcuts. ";
    maintainers = with lib.maintainers; [ ckgxrg ];
    license = lib.licenses.cc0;
  };
}

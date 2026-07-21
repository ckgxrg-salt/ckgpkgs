{
  buildVimPlugin,
  fetchurl,
  lib,
}:
buildVimPlugin {
  pname = "im-select.nvim";
  version = "2026-03-19";
  src = fetchurl {
    url = "https://github.com/keaising/im-select.nvim/archive/963a4e9d528ef8a8d328eeff690593b0146d30e2.tar.gz";
    sha256 = "sha256-Q9ZKAz92asAbdWEbuVftXpNNrFa0EfXuFeD3FyC3FJw=";
  };
  meta = {
    homepage = "https://github.com/keaising/im-select.nvim";
    description = "Switch Input Method automatically depends on Neovim's edit mode";
    maintainers = with lib.maintainers; [ ckgxrg ];
    license = lib.licenses.mit;
  };
}

{
  buildVimPlugin,
  fetchurl,
  lib,
}:
buildVimPlugin {
  pname = "auto-indent.nvim";
  version = "2023-11-03";
  src = fetchurl {
    url = "https://github.com/VidocqH/auto-indent.nvim/archive/46801cf8857d42a20a73c40b0a5d3dfe8b2b6192.tar.gz";
    sha256 = "sha256-dP/xRRn2bFZHxEifJ7+c1W9277xU5Neo0Ty+hjrSq7c=";
  };
  meta = {
    homepage = "https://github.com/VidocqH/auto-indent.nvim";
    description = "Auto indent like VSCode when cursor at the first column and press <TAB> key.";
    maintainers = with lib.maintainers; [ ckgxrg ];
    license = lib.licenses.mit;
  };
}

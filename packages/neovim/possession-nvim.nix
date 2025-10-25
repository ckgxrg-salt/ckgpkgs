{
  buildVimPlugin,
  fetchurl,
  lib,
}:
buildVimPlugin {
  pname = "possession-nvim";
  version = "2025-10-21";
  src = fetchurl {
    url = "https://github.com/jedrzejboczar/possession.nvim/archive/fbea95b16c284727bc8deff2c3780a73efcdaca6.tar.gz";
    sha256 = "1j95sj1wnhnq8wl389lp8zfwfzx1rcgnxra9619qcl0zf284y0wa";
  };
  meta = {
    homepage = "https://github.com/jedrzejboczar/possession.nvim";
    description = "Flexible session management for Neovim. ";
    maintainers = with lib.maintainers; [ ckgxrg ];
    license = lib.licenses.mit;
  };
}

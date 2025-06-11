{
  buildGoModule,
  fetchFromGitHub,
  clangStdenv,
  lib,
}:
buildGoModule rec {
  pname = "postmoogle";
  version = "0.9.26";

  src = fetchFromGitHub {
    owner = "etkecc";
    repo = "postmoogle";
    rev = "v${version}";
    hash = "sha256-y4Nv6TnN80QRZlZEM0I5YIcsx4LHpsKsJYzJ4nyotME=";
  };
  vendorHash = null;

  buildInputs = [
    clangStdenv.cc.libc
  ];

  env.CGO_ENABLED = 0;
  ldflags = [
    "-extldflags \"-static\""
  ];
  tags = [
    "timetzdata"
    "goolm"
  ];

  subPackages = [
    "cmd/postmoogle"
  ];

  meta = {
    homepage = "https://github.com/etkecc/postmoogle";
    description = "Postmoogle is Matrix <-> Email bridge in a form of an SMTP server";
    license = lib.licenses.agpl3Only;
  };
}

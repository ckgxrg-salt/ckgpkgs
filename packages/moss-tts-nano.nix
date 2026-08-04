{
  lib,
  python3Packages,
  fetchFromGitHub,
}:
python3Packages.buildPythonApplication {
  pname = "moss-tts-nano";
  version = "0-unstable-2026-07-26";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "OpenMOSS";
    repo = "MOSS-TTS-Nano";
    rev = "cc7bdf19c7639c0870dab22045a33b442760f6be";
    hash = "sha256-Kg6cmujSeOGLiFVwXd1+j9EDJZuCF3F9Ri0NtFwDLN8=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "torch==2.7.0" "torch>=2.7.0" \
      --replace-fail "torchaudio==2.7.0" "torchaudio>=2.7.0" \
      --replace-fail "transformers==4.57.1" "transformers>=4.57.1"
  '';

  build-system = with python3Packages; [ setuptools ];

  dependencies = with python3Packages; [
    numpy
    fastapi
    python-multipart
    sentencepiece
    torch
    torchaudio
    transformers
    uvicorn
    onnxruntime
  ];

  meta = {
    description = "Open-source multilingual tiny speech generation model from MOSI.AI and the OpenMOSS team";
    homepage = "https://github.com/OpenMOSS/MOSS-TTS-Nano";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.ckgxrg ];
  };
}

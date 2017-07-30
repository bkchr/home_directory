with import <nixpkgs> {};
let
  python3dlib = pkgs.python35Packages.buildPythonPackage rec {
      name = "toolz-${version}";
      version = "19.4.0";

      src = pkgs.fetchurl {
        url = "mirror://pypi/d/dlib/dlib-${version}.tar.gz";
        sha256 = "1f4m13y365qx1y7q87xywgsqyvlq9r0scarf741zfyrdshnifg62";
      };

      propagatedBuildInputs = [ cmake boost ];

      meta = {
        homepage = "https://github.com/davisking/dlib";
        description = "A toolkit for making real world machine learning and data analysis applications";
      };
    };
in
stdenv.mkDerivation {
  name = "ownphotos-backend";
  buildInputs = [ python3 python3dlib python3Packages.pip python3Packages.virtualenv freetype libpng libjpeg pkgconfig postgresql python3Packages.numpy python3Packages.scipy ];
  shellHook = ''
  # set SOURCE_DATE_EPOCH so that we can use python wheels
  SOURCE_DATE_EPOCH=$(date +%s)
  virtualenv --no-setuptools venv
  export PATH=$PWD/venv/bin:$PATH
  pip install -r requirements.txt
  '';
}

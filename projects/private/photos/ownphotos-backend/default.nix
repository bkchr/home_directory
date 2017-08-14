with import <nixpkgs> {};

let
  myboost = pkgs.boost.override({python=python35;});
  python3dlib = pkgs.python35Packages.buildPythonPackage rec {
      name = "dlib-${version}";
      version = "19.4.0";

      src = pkgs.fetchurl {
        url = "mirror://pypi/d/dlib/dlib-${version}.tar.gz";
        sha256 = "1f4m13y365qx1y7q87xywgsqyvlq9r0scarf741zfyrdshnifg62";
      };

      buildInputs = with python35Packages; [ cmake myboost.dev pkgconfig python35 ];

      meta = {
        homepage = "https://github.com/davisking/dlib";
        description = "A toolkit for making real world machine learning and data analysis applications";
      };
    };
  mypython=pkgs.python35.withPackages (ps: [ python3dlib ps.numpy ps.scipy ps.scikitlearn ps.pip ps.matplotlib ps.virtualenv ]);
in
stdenv.mkDerivation {
  name = "ownphotos-backend";
  buildInputs = [ mypython freetype libpng libjpeg pkgconfig postgresql myboost torch ];
}


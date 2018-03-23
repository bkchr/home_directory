with import <nixpkgs> {};
let 
  myopencv = opencv3.override { enableGtk3 = true; };
in
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ openssl pkgconfig clang cmake myopencv libv4l ];
  ANDROID_NDK_HOME = "${androidenv.androidndk}";
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

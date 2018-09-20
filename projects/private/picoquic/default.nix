with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "picoquic";
  buildInputs = [ openssl pkgconfig clang cmake ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
} 

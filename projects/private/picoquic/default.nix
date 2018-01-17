with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "picoquic";
  buildInputs = [ openssl pkgconfig clang cmake ];
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
} 

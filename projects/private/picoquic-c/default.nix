with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "picoquic";
  buildInputs = [ openssl pkgconfig cmake valgrind ];
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
} 

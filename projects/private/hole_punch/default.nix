with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "hole_punch";
  buildInputs = [ openssl pkgconfig clang ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

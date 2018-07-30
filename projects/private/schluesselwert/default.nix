with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "private";
  PROTOC="${protobuf}/bin/protoc";
  buildInputs = [ openssl pkgconfig clang ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';

}

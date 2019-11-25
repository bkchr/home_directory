with import <nixpkgs> {};

let
  myrust = ((rustChannelOf { date = "2019-11-22"; channel = "nightly"; }).rust.override { extensions = [ "rust-src" "rust-analysis" "rustfmt-preview" ];});
in
stdenv.mkDerivation {
  name = "hole_punch";
  buildInputs = [ openssl pkgconfig clang python2 python2Packages.yapf myrust cacert ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
    unset SSL_CERT_FILE
  '';
}

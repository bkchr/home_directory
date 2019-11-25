with import <nixpkgs> {};

let
  myrust = ((rustChannelOf { date = "2019-06-11"; channel = "nightly"; }).rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" "clippy-preview" ];});
in
stdenv.mkDerivation {
  name = "hole_punch";
  buildInputs = [ openssl pkgconfig clang python2 python2Packages.yapf myrust ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
    unset SSL_CERT_FILE
  '';
}

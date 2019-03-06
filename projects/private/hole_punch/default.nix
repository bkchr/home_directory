with import <nixpkgs> {};

let
  myrust = ((rustChannelOf { date = "2019-03-05"; channel = "nightly"; }).rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" "clippy-preview" ];});
in
stdenv.mkDerivation {
  name = "hole_punch";
  buildInputs = [ openssl pkgconfig clang python2 python2Packages.yapf myrust ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

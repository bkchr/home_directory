with import <nixpkgs> {};
let
  myrust = ((rustChannelOf { date = "2019-03-05"; channel = "nightly"; }).rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" "clippy-preview" ]; targets = [ "wasm32-unknown-unknown" ]; });
in 
stdenv.mkDerivation {
  name = "picoquic";
  buildInputs = [ myrust openssl pkgconfig clang cmake gdb ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
} 

with import <nixpkgs> {};
let
  myrust = ((rustChannelOf { date = "2019-11-20"; channel = "nightly"; }).rust.override { extensions = [ "rust-src" "rust-analysis" "rustfmt-preview" ]; targets = [ "wasm32-unknown-unknown" ]; });
in 
stdenv.mkDerivation {
  name = "picoquic";
  buildInputs = [ myrust openssl pkgconfig clang cmake gdb cacert ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
} 

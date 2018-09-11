with import <nixpkgs> {};
let
  myrust = (latest.rustChannels.nightly.rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" "clippy-preview" ]; targets = [ "wasm32-unknown-unknown" ]; });
in
stdenv.mkDerivation {
  name = "substrate";
  buildInputs = [ myrust openssl pkgconfig cmake python3 ];
}

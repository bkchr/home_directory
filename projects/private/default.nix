with import <nixpkgs> {};
let
  myrust = (rustChannelOf { date = "2019-07-19"; channel = "nightly"; }).rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" "clippy-preview" ];};
in
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ myrust ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
}

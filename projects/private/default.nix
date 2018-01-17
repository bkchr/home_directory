with import <nixpkgs> {};
let
  myrust = (latest.rustChannels.nightly.rust.override { extensions = [ "rust-src" ];});
in
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ myrust ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
}

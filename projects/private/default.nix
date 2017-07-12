with import <nixpkgs> {};
let
  myrust = (rustChannels.nightly.rust.override { extensions = [ "rust-src" ];});
in
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ myrust elmPackages.elm nodejs texlive.combined.scheme-full ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
}

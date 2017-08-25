with import <nixpkgs> {};
let
  myrust = (latest.rustChannels.nightly.rust.override { extensions = [ "rust-src" ];});
in
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ myrust elmPackages.elm nodejs texlive.combined.scheme-full openssl pkgconfig cmake zlib ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
}

with import <nixpkgs> {};
let
  myrust = (latest.rustChannels.nightly.rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" ]; targets = [ "mips-unknown-linux-musl" "mipsel-unknown-linux-musl" ];});
in
stdenv.mkDerivation {
  name = "superscale";
  buildInputs = [ myrust go openssl llvm minicom json_c iw pkgconfig clang socat godef gocode bluez docker_compose libseccomp nomad terraform goimports consul quilt cmake ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';

} 

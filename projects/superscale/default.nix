with import <nixpkgs> {};
let
  myrust = (latest.rustChannels.nightly.rust.override { extensions = [ "rust-src" "rust-analysis" ]; targets = [ "mips-unknown-linux-musl" "mipsel-unknown-linux-musl" ]; });
in
stdenv.mkDerivation {
  name = "superscale";
  buildInputs = [ myrust elixir go openssl llvm minicom json_c qemu iw pkgconfig qemu clang socat godef gocode bluez docker_compose libseccomp nomad terraform goimports consul ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
} 

with import <nixpkgs> {};
let
  myrust = (rustChannels.stable.rust.override { extensions = [ "rust-src" "rust-analysis" ]; targets = [ "mips-unknown-linux-musl" ]; targetExtensions = [ "rust-analysis" ]; });
in
stdenv.mkDerivation {
  name = "superscale";
  buildInputs = [ myrust elixir go openssl llvm minicom json_c qemu iw pkgconfig qemu socat clang godef gocode bluez docker_compose libseccomp nomad terraform ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
}

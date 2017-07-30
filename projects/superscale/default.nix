with import <nixpkgs> {};
let
  myrust = (rustChannels.stable.rust.override { extensions = [ "rust-src" "rust-analysis" ]; targets = [ "mips-unknown-linux-musl" ]; targetExtensions = [ "rust-analysis" ]; });
in
stdenv.mkDerivation {
  name = "superscale";
  buildInputs = [ myrust elixir go erlang openssl llvm minicom json_c qemu iw pkgconfig elixir qemu socat clang godef gocode go bluez docker_compose libseccomp ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
  GOPATH="$PWD/goprojects";
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
}

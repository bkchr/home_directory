with import <nixpkgs> {};
let
  myrust = (rustChannels.stable.rust.override { extensions = [ "rust-src" ]; targets = [ "mips-unknown-linux-musl" ]; });
in
stdenv.mkDerivation {
  name = "superscale";
  buildInputs = [ myrust elixir go erlang openssl llvm minicom json_c qemu iw pkgconfig elixir qemu socat clang godef gocode go bluez ];
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
  GOPATH="$PWD/goprojects";
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
}

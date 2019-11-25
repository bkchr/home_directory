with import <nixpkgs> {};
let
  myrust = ((rustChannelOf { date = "2019-10-13"; channel = "nightly"; }).rust.override { extensions = [ "rust-src" "rust-analysis" "rustfmt-preview" ]; targets = [ "wasm32-unknown-unknown" ]; });
  wasm-gc = rustPlatform.buildRustPackage rec {
    name = "wasm-gc-${version}";
    version = "0.1.11";
    src = fetchFromGitHub {
      owner = "alexcrichton";
      repo = "wasm-gc";
      rev = "wasm-gc-api-${version}";
      sha256 = "0nw6yhgn3d38s1dmh4jkiccsrks5i1cpjgb7r52l2n8cnry4h1zs";
    };

    cargoSha256 = "1sr54na5pvqxb38g8187w1z5a88lfidyb5a0q8fdfnxjjrny1556";
  };
in
stdenv.mkDerivation {
  name = "substrate";
  buildInputs = [ myrust wasm-gc openssl pkgconfig cmake python3 llvmPackages.clang-unwrapped gnuplot libbfd libopcodes libunwind autoconf automake libtool cacert rsync ];
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  RUST_SRC_PATH="${myrust}/lib/rustlib/src/rust/src";
  ROCKSDB_LIB_DIR="${rocksdb}/lib";
  PROTOC = "${protobuf}/bin/protoc";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

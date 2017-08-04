with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "bindgen";
  buildInputs = [ llvm clang ];
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
}

with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "bindgen";
  buildInputs = [ llvm clang graphviz ];
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
}

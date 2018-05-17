with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ openssl pkgconfig clang cmake ];
  ANDROID_NDK_HOME = "${androidenv.androidndk}/libexec/${androidenv.androidndk.name}";
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

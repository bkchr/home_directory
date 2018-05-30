with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ openssl pkgconfig clang cmake ];
  ANDROID_NDK_HOME = "${androidenv.androidndk_16b}/libexec/${androidenv.androidndk_16b.name}";
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

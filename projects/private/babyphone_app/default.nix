with import <nixpkgs> {};
let
  androidndk = androidenv.androidndk_16b.override { fullNDK = true; };
in
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ openssl pkgconfig clang cmake gst_all_1.gstreamer ];
  ANDROID_NDK_HOME = "${androidndk}/libexec/${androidndk.name}";
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

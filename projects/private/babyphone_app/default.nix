with import <nixpkgs> {};
let
  androidndk = androidenv.androidndk_16b.override { fullNDK = true; };
  bad = gst_all_1.gst-plugins-bad.override { faacSupport = true; };
in
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ openssl pkgconfig clang cmake bad gst_all_1.gstreamer gst_all_1.gst-plugins-base gst_all_1.gst-plugins-good ];
  ANDROID_NDK_HOME = "${androidndk}/libexec/${androidndk.name}";
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

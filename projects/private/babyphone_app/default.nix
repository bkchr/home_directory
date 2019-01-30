with import <nixpkgs> {};
let
  androidndk = androidenv.androidndk_16b.override { fullNDK = true; };
  bad = gst_all_1.gst-plugins-bad.override { faacSupport = true; };
  myrust = (rustChannelOf { date = "2019-01-08"; channel = "nightly"; }).rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" "clippy-preview" ];};
in
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ myrust openssl pkgconfig clang cmake bad gst_all_1.gstreamer gst_all_1.gst-plugins-base gst_all_1.gst-plugins-good gst_all_1.gst-plugins-ugly gst_all_1.gst-libav dbus alsaLib ];
  ANDROID_NDK_HOME = if stdenv.isx86_64 then "${androidndk}/libexec/${androidndk.name}" else "NOTSUPPORTED";
  LIBCLANG_PATH="${llvmPackages.libclang}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
}

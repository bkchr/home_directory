with import <nixpkgs> {};

let
  bad = gst_all_1.gst-plugins-bad.override { faacSupport = true; };
in
stdenv.mkDerivation {
  name = "gstreamer-rs";
  buildInputs = [ gst_all_1.gstreamer pkgconfig gst_all_1.gst-plugins-base bad gst_all_1.gst-plugins-good gst_all_1.gst-plugins-ugly gst_all_1.gst-rtsp-server gst_all_1.gst-libav ];
  ANDROID_NDK_HOME = "${androidenv.androidndk}/libexec/${androidenv.androidndk.name}";
}

with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "gstreamer-rs";
  buildInputs = [ gst_all_1.gstreamer pkgconfig gst_all_1.gst-plugins-base gst_all_1.gst-plugins-bad gst_all_1.gst-plugins-good gst_all_1.gst-plugins-ugly gst_all_1.gst-libav gst_all_1.gst-editing-services ];
}

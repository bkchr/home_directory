with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "rust";
  buildInputs = [ python2 cmake wabt openssl pkgconfig zlib cacert ];
}

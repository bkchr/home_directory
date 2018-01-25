with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "rust";
  buildInputs = [ python2 cmake nodejs-9_x wabt openssl pkgconfig zlib ];
}

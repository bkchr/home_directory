with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "rust";
  buildInputs = [ python2 cmake ];
}

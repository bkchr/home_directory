with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "bewerbung";
  buildInputs = [ texlive.combined.scheme-full ];
}

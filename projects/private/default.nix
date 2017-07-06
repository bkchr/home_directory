with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "private";
  buildInputs = [ elmPackages.elm nodejs texlive.combined.scheme-full ];
}

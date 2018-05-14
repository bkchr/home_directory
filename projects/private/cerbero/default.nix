with import <nixpkgs> {};

mkShell {
  name = "cerbero";
  buildInputs = [ python3 libtool flex automake pkgconfig cmake bison ];
}

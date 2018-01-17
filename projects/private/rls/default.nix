with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "rls";
  buildInputs = [ openssl pkgconfig cmake zlib ];
} 

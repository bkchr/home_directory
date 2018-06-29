with import <nixpkgs> {};
let
  openssl_1_1_1 = openssl_1_1_0.overrideAttrs (old: rec {
    name = "openssl-${version}";
    version = "1.1.1-pre8";
    src = fetchurl {
      url = "http://www.openssl.org/source/${name}.tar.gz";
      sha256 = "07ij96wl5wj8v7mnv7fqhy2rwnbl0xdqlrchql692b6r7mvcs18j";
    };
    preConfigure = old.preConfigure + ''
      substituteInPlace Configurations/unix-checker.pm --replace /usr/bin/perl ${perl}/bin/perl
      patchShebangs .
      substituteInPlace config --replace /usr/bin/env ""
    '';
  });
in
stdenv.mkDerivation {
  name = "picoquic";
  buildInputs = [ openssl_1_1_1 pkgconfig cmake valgrind ];
  LIBCLANG_PATH="${llvmPackages.clang-unwrapped}/lib";
  shellHook = ''
    export NIX_CXXSTDLIB_LINK=""
  '';
} 

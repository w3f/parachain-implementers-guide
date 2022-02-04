{ lib, stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage rec {
  pname = "mdbook-linkcheck";
  version = "0.7.6";

  src = fetchFromGitHub {
    owner = "Michael-F-Bryan";
    repo = pname;
    rev = "v${version}";
    sha256 = "ZEOuA8W05800cnArscaGGOWTgzU6V3/wJiQcSx1MVkY=";
  };

  cargoSha256 = "EtPhbKvPHSnmPXemCzOXujlqqfdDSFaJpcZVJoHQq6U=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];

  OPENSSL_NO_VENDOR = 1;

  doCheck = false;
}

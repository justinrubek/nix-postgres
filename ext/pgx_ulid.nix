{ lib, stdenv, fetchFromGitHub, postgresql, buildPgrxExtension }:

buildPgrxExtension rec {
  pname = "pgx_ulid";
  version = "0.1.3";
  inherit postgresql;

  src = fetchFromGitHub {
    owner  = "justinrubek";
    repo   = pname;
    rev    = "74d378125542385aedf31d827fa15e3a19543f8d";
    hash   = "sha256-dXrfisuKAxC/dIN6B4AtXpgj7NfP1rUZEAET+0q6Fds=";
  };

  cargoHash = "sha256-GR+QgTlgT2oCPGnKAH+AN9mrMVD3+tLmtBBE1w7MWmg=";

  doCheck = false;

  meta = with lib; {
    description = "Ulid type for PostreSQL";
    homepage    = "https://github.com/justinrubek/${pname}";
    platforms   = postgresql.meta.platforms;
  };
}

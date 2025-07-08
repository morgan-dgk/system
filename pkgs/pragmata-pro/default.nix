{
  stdenv,
  lib,
  unzip,
  requireFile,
  ...
}: let
  url = "https://fsd.it/shop/fonts/pragmatapro/";
  hashAlgo = "sha256";
  name = "PragmataPro0.9.8-svlok.zip";
  version = "0.9.8";
in
  stdenv.mkDerivation {
    nativeBuildInputs = [unzip];

    pname = "pragmata-pro";
    inherit version;
    src = requireFile {
      name = "PragmataPro0.9-8svlok.zip";
      sha256 = "3178e90cd5320333038fb09d3972da83e50e194d3702d00c8ecad5b5f5e7579d";
      url = "https://fsd.it/shop/fonts/pragmatapro/";
      message = ''
        PragmataPro is a (beautiful) licensed typeface.

        Please go to ${url} to purchase a copy, so it can be added to the Nix store.
        using either
          nix-store --add-fixed ${hashAlgo} ${name}
        or
          nix-prefetch-url --type ${hashAlgo} file:///path/to/${name}
      '';
    };
    sourceRoot = "PragmataPro0.9";

    installPhase = ''
      mkdir -p $out/share/fonts/truetype/
      cp -r ./*.ttf $out/share/fonts/truetype/
    '';

    meta = with lib; {
      description = ''
        PragmataPro™ is a condensed monospaced font optimized for screen, designed by Fabrizio Schiavi to be the ideal font for coding, math and engineering
      '';
      homepage = url;
      platforms = platforms.all;
    };
  }

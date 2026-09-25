{
  stdenv,
  lib,
  unzip,
  requireFile,
  ...
}: let
  url = "https://fsd.it/shop/fonts/pragmatapro/";
  hashAlgo = "sha256";
  name = "PragmataPro0.903";
  version = "0.903.0";
in
  stdenv.mkDerivation {
    nativeBuildInputs = [unzip];

    pname = "pragmata-pro";
    inherit version;
    src = requireFile {
      name = "PragmataPro0.903.0.zip";
      sha256 = "770400e9d4f3d40fe8893af9ae1f784f6ffad241fc4189128c4d3c4615fb7727";
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
    sourceRoot = "PragmataPro0.903";

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

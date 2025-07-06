{
  stdenv,
  lib,
  pkgs,
  ...
}:
stdenv.mkDerivation {
  nativeBuildInputs = [pkgs.unzip];

  pname = "pragmata-pro";
  version = "0.9.8";
  src = ./etc/PragmataPro0.9-8svlok.zip;
  sourceRoot = "PragmataPro0.9";

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r ./*.ttf $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "Pragmata Pro";
    homepage = "https://fsd.it/shop/fonts/pragmatapro/";
    platforms = platforms.all;
  };
}

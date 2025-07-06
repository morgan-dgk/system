{
  pkgs,
  lib,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri.package = pkgs.niri-stable;
  programs.niri.enable = true;
}

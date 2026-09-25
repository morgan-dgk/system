{
  pkgs,
  lib,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    (final: prev: {
      libdisplay-info_0_2 = prev.libdisplay-info_0_3.overrideAttrs (old: {
        version = "0.2.0";

        src = prev.fetchFromGitLab {
          domain = "gitlab.freedesktop.org";

          owner = "emersion";

          repo = "libdisplay-info";

          tag = "0.2.0";

          hash = "sha256-6xmWBrPHghjok43eIDGeshpUEQTuwWLXNHg7CnBUt3Q=";
        };
      });
    })
  ];
  programs.niri.package = pkgs.niri-stable;
  programs.niri.enable = true;

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
  };
}

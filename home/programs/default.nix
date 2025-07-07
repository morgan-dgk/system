{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./walker.nix
    (import ./zen-browser.nix {firefox-addons = inputs.firefox-addons;})
  ];
}

{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    (import ./zen-browser.nix {firefox-addons = inputs.firefox-addons;})
  ];
}

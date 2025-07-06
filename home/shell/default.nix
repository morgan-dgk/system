{config, ...}: let
  data_dir = config.xdg.dataHome;
  conf_dir = config.xdg.configHome;
in {
  imports = [
    ./terminal.nix
  ];
}

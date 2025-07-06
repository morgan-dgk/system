{
  pkgs,
  config,
  ...
}: {
  programs.walker = {
    enable = true;
    runAsService = true;
  };
}

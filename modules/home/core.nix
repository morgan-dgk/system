{
  inputs,
  username,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;

  imports = [
    inputs.niri.homeModules.niri
    inputs.walker.homeManagerModules.default
    inputs.zen-browser.homeModules.beta
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "vim";
    };

    stateVersion = "25.05";

    packages = with pkgs; [
      tree
      jq
      yq-go
      vim
      zip
      xz
      unzip
      dnsutils
      pciutils
      iwmenu
      bitwarden-cli
      inputs.bzmenu
      ( pkgs.callPackage ../../pkgs/pragmata-pro {} )
    ];
  };

  programs.home-manager.enable = true;
}

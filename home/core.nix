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
      NIXOS_OZONE_WL = "1";
    };

    stateVersion = "25.05";

    packages = with pkgs; [
      tree
      jq
      yq-go
      brightnessctl
      vim
      zip
      xz
      unzip
      dnsutils
      pciutils
      bitwarden-cli
      pre-commit
      inputs.alejandra.defaultPackage.${system}
      inputs.iwmenu.packages.${pkgs.system}.default
      inputs.bzmenu.packages.${pkgs.system}.default
      (pkgs.callPackage ../pkgs/pragmata-pro {})
    ];
  };

  programs.home-manager.enable = true;

  services = {
    swaync.enable = true;
  };
}

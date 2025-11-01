{
  inputs,
  username,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    inputs.walker.homeManagerModules.default
    inputs.zen-browser.homeModules.beta
    inputs.nvim.homeModule
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    stateVersion = "25.05";

    packages = with pkgs; [
      devenv
      tree
      file
      jq
      pavucontrol
      yq-go
      brightnessctl
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

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gnome
    pkgs.gnome-keyring
  ];

  fonts.fontconfig.enable = true;
  nvim.enable = true;
  programs.home-manager.enable = true;

  services = {
    swaync.enable = true;
  };
}

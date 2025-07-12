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
      tree
      jq
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

  fonts.fontconfig.enable = true;
  nvim.enable = true;
  programs.home-manager.enable = true;

  services = {
    swaync.enable = true;
  };
}

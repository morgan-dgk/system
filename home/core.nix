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

  nixpkgs.overlays = [
    (final: prev: {
      xwlsat-run = final.writeShellScriptBin "xwlsat-run" ''
        n=0
        while [ -e "/tmp/.X11-unix/X$n" ]; do
          n=$((n + 1))
        done

        xwayland-satellite :$n &

        xwlsat_pid=$!

        export DISPLAY=:$n

        DISPLAY=:$n "$@"

        kill $xwlsat_pid
      '';
    })
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
      xwayland-satellite
      xwlsat-run
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = ["gtk"];
      };
      niri = {
        default = [
          "gtk"
          "gnome"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
        "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
      };
    };
  };

  fonts.fontconfig.enable = true;
  nvim.enable = true;
  programs.home-manager.enable = true;

  services = {
    swaync.enable = true;
  };
}

{
  pkgs,
  lib,
  username,
  ...
}: {
  imports = [
    ./virtualization.mod.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel"];
  };
  programs.zsh.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraPackages = with pkgs; [
      gamescope
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  users.defaultUserShell = pkgs.zsh;

  hardware.xpadneo.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    wget
  ];
}

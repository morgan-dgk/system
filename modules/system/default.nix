{
  pkgs,
  lib,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel"];
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than-7d";
  };

  time.timeZone = "Australia/Sydney";

  programs.zsh.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    gamescopeSession.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    curl
    git
    wget
  ];

  services.pulseaudio.enable = false;

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}

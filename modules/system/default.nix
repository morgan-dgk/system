{
  pkgs,
  lib,
  username,
  ...
}: {
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

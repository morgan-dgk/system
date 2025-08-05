{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    main = {modules-right = ["clock"];};
  };

  services.safeeyes.enable = true;
  services.snixembed = {
    enable = true;

    beforeUnits = [
      # https://github.com/slgobinath/SafeEyes/wiki/How-to-install-backend-for-Safe-Eyes-tray-icon
      "safeeyes.service"
    ];
  };
}

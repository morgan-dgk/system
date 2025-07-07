{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.niri.package = pkgs.niri-stable;

  programs.niri.settings = {
    layout = {
      preset-column-widths = [
        {proportion = 1.0 / 3.0;}
        {proportion = 1.0 / 2.0;}
        {proportion = 2.0 / 3.0;}
      ];
      default-column-width = {
        proportion = 1.0 / 3.0;
      };
    };

    binds = with config.lib.niri.actions; let
      sh = spawn "sh" "-c";
    in {
      # Windows
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Up".action = focus-window-up;
      "Mod+Down".action = focus-window-down;

      "Mod+Ctrl+Left".action = move-column-left;
      "Mod+Ctrl+Right".action = move-column-right;
      "Mod+Ctrl+Up".action = move-window-up;
      "Mod+Ctrl+Down".action = move-window-down;
      "Mod+Comma".action = consume-window-into-column;
      "Mod+Period".action = expel-window-from-column;

      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";
      "Mod+Shift+Minus".action = set-window-height "-10%";
      "Mod+Shift+Equal".action = set-window-height "+10%";

      # Monitors
      "Mod+Shift+Left".action = focus-monitor-previous;
      "Mod+Shift+Right".action = focus-monitor-next;

      # General
      "Mod+Tab".action = focus-window-down-or-column-right;
      "Mod+Shift+Tab".action = focus-window-up-or-column-left;
      "Mod+W".action = close-window;
      "Mod+Shift+V".action = toggle-window-floating;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+Shift+Slash".action = show-hotkey-overlay;
      "Mod+Shift+E".action = quit {skip-confirmation = true;};

      # Applications
      "Mod+Q".action = spawn "kitty";
      "Mod+space".action = spawn "walker";

      # Audio
      "XF86AudioRaiseVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
      "XF86AudioLowerVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
      "XF86AudioMute".action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      # Backlight
      "XF86MonBrightnessUp".action = sh "brightnessctl set 10%+";
      "XF86MonBrightnessDown".action = sh "brightnessctl set 10%-";
    };
  };
}

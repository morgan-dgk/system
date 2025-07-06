{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.niri.package = pkgs.niri-stable;

  programs.niri.settings = {
    binds = with config.lib.niri.actions;
      lib.attrsets.mergeAttrsList [
        {
          "Mod+Q".action = spawn "kitty";
          "Mod+space".action = spawn "walker";
          "Mod+Shift+E".action = quit {skip-confirmation = true;};
          "Mod+Shift+F".action = fullscreen-window;
          
        }
      ];
  };
}

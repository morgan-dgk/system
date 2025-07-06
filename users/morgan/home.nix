{pkgs, ...}: {
  imports = [
    ../../home/core.nix
    ../../home/shell
    ../../home/niri
    ../../home/walker
    ../../home/zen-browser
    ../../home/programs
  ];

  home.sessionVariables = {
     EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    userName = "morgan-dgk";
    userEmail = "mdgk95@proton.me";
    extraConfig = {
       init.defaultBranch = "main";
       pull.rebase = true;
       merge.conflictStyle = "zdiff3";
    };
  };
}

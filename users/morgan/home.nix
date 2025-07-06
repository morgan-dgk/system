{pkgs, ...}: {
  imports = [
    ../../modules/home/core.nix
    ../../modules/home/shell
    ../../modules/home/niri
    ../../modules/home/walker
    ../../modules/home/zen-browser
    ../../modules/home/programs
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
       push.autoSetupRemote = true;
       merge.conflictStyle = "zdiff3";
    };
  };
}

{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home/core.nix
    ../../modules/home/shell
    ../../modules/home/niri
    ../../modules/home/walker
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

  programs.keychain = {
    enable = true;
    enableZshIntegration = true;
    keys = [
      "nixos-ed25519.id"
    ];
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "cypher";
    };
  };
}

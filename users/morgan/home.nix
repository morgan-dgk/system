{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../home/core.nix
    ../../home/shell
    ../../home/niri
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
      push.autoSetupRemote = true;
      merge.conflictStyle = "zdiff3";
      alias = {
        clear = with lib;
          trim (concatStrings [
            "! f() { git fetch -p && for branch in "
            "$(git for-each-ref --format '%(refname) %(upstream:track)'"
            "refs/heads "
            "| awk '$2 = \"[gone]\" {sub(\"refs/heads/\", \"\", $1); print $1}'); "
            "do git branch -D $branch; done ;}; f"
          ]);
      };
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

{ config, ... }: {
  home.packages = with pkgs; [
    lazygit
    git-credential-oauth
  ];
  programs.git = {
    enable = true;
    userName = "Lulu Yume";
    userEmail = "lu@luyu.me";
    extraConfig = {
      init.defaultBranch = "main";
      user.signing.key = "B9188C810832C1B625F11F3CAB0A5468072EE5DA";
      commit.gpgSign = true;
      gpg.program = "${config.programs.gpg.package}/bin/gpg2";
    };
  };
}

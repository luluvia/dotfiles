{ pkgs, ... }: {
  home.pkgs = with pkgs; [ _1password-gui _1password ];
}
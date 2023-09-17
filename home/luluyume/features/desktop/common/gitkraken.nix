{ pkgs, ... }: {
  home.pkgs = with pkgs; [ unstable.gitkraken ];
}
{ pkgs, ... }: {
  home.pkgs = with pkgs; [ unstable.jetbrains-toolbox ];
}
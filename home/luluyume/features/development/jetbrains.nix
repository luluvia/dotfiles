{ pkgs, ... }: {
  home.packages = with pkgs; [
    jetbrains.rust-rover
    jetbrains.webstorm
    jetbrains.idea-ultimate
  ];
}

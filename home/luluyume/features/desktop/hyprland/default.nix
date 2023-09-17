{ config, pkgs, ... }:
{
  imports = [
    ../common
    ../common/wayland-wm
  ];

  home.packages = with pkgs; [
    hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      bind = let
        terminal = config.home.sessionVariables.TERMINAL;
      in [
        "SUPER,Return,exec,${terminal}"
        "SUPER,x,exec,fuzzel"
      ];
    };
  };
}

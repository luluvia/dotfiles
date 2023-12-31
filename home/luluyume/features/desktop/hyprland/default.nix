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
    package = pkgs.inputs.hyprland.hyprland;

    extraConfig = ''
      $mod = SUPER

      bind = $mod, Return, exec, kitty
      bind = $mod, x, exec, fuzzel 
    '';
  };
}

{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.theme = "breeze";
  };

  programs.hyprland = {
    enable = true;
    package = pkgs.inputs.hyprland.hyprland;
  }
}
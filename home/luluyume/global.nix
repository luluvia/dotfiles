{ lib, pkgs, config, inputs, outputs, ... }:
{
  imports = [
    # inputs.hyprland.homeManagerModules.default
    ./features/cli
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;

    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = lib.mkDefault "luluyume";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.11";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      FLAKE = "$HOME/Documents/NixConfig";
    };
  };
}

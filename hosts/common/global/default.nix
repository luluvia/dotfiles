# Global configuration for all hosts
{ inputs, outputs, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./fish.nix
    ./git.nix
    ./locale.nix
    ./nix.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = with pkgs; [
    lshw
    lsof
    # fastfetch
  ];

  users.mutableUsers = true;
}

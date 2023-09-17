# Global configuration for all hosts
{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locale.nix
    ./nix.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  users.mutableUsers = true;
}
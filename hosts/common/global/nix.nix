{ inputs, lib, ... }:
{
  nix = {
    trusted-users = [ "root" "@wheel" ];
    auto-optimise-store = lib.mkDefault true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Add each flake input as a registry
  # To make nix3 commands consistent with the flake
  registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
}
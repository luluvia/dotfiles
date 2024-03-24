# Yume - NixOS configurations and dotfiles

Configuration files for my NixOS machines and dotfiles for my user accounts. Requires [Nix flakes](https://nixos.wiki/wiki/Flakes).

## Structure

- `flake.nix`: The entry point for the flake.
- `flake.lock`: The lock file for the flake.
- `hosts`: Host-specific configurations, accessible via `nixos-rebuild switch --flake '.#<hostname>'`.
  - `common`: Common configurations for all hosts.
    - `global`: Global configurations for all hosts.
    - `optional`: Optional configurations for all hosts.
  - `sudama`: Desktop PC - i5-13600KF, 32GB RAM, RTX 3080 | Hyprland (inactive)
  - `kodama`: Laptop - i7-11700H, 16GB RAM, GTX 3060 | Hyprland (retired)
  - `orpheus`: Laptop - i7-12700H, 16GB RAM, Arc A370M | Plasma 6
- `home`: User-specific configurations, accessible via `home-manager switch --flake '.#<username>@<hostname>'`.`

## Acknowledgements

- [NixOS](https://nixos.org/)
- [Home Manager](https://github.com/nix-community/home-manager)
- [NixOS Wiki](https://nixos.wiki/)
- [Misterio77](https://github.com/Misterio77)

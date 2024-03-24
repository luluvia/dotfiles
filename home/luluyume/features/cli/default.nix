{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./fish.nix
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    bottom # Better top
    ncdu # Better du
    eza # Better ls
    ripgrep # Better grep
    httpie # Better curl

    nil # Nix LSP
  ];
} 

{ pkgs, ... }: {
  home.pkgs = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
      ];
    })
  ];
}

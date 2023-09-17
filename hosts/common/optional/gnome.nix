{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs.gnome; [
    gedit
    epiphany
    geary
    tali
    iagno
    hitori
    atomix
  ]);
}
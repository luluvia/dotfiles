# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{
  # You can import other NixOS modules here
  imports = [
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

    ../common/global
    ../common/users/luluyume

    ../common/optional/kde.nix
    ../common/optional/pipewire.nix
  ];

  # Make sure the encrypted device is available
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-label/kodama-n";
      preLVM = true;
    };
  };
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kodama-n";
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    nvidia = {
      modesetting.enable = true;
      prime.offload.enable = true;
      prime.intelBusId = "PCI:0:2:0";
      prime.nvidiaBusId = "PCI:1:0:0";
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}

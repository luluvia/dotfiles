# Thermal and power management services for laptops.
{
  services.tlp.enable = true;
  services.thermald.enable = true;
  # power profiles daemon does not work with TLP.
  services.power-profiles-daemon.enable = false;
}

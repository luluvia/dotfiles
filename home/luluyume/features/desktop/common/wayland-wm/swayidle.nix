{
  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    timeouts =
      [{
        timeout = 300;
        command = "swaylock -f -c 000000";
      }];
  };
}
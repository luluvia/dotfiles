{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settngs = {
      primary = {
        mode = "dock";
        layer = "top";
        height = 40;
        margin = "6";
        position = "top";
      };
    };
  };
}
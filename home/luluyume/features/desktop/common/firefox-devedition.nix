{ pkgs, ... }:
{
  home.packages = with pkgs; [ firefox-devedition ];

  xdg.mimeApps.defaultApplications = {
    "text/html" = "firefox-devedition.desktop";
    "text/xml" = "firefox-devedition.desktop";
    "x-scheme-handler/http" = "firefox-devedition.desktop";
    "x-scheme-handler/https" = "firefox-devedition.desktop";
  };
}
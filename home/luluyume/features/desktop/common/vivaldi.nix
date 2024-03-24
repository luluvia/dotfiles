{ pkgs, ... }:
{
  home.packages = with pkgs; [ vivaldi ];

  xdg.mimeApps.defaultApplications = {
    "text/html" = "vivaldi";
    "text/xml" = "vivaldi";
    "x-scheme-handler/http" = "vivaldi";
    "x-scheme-handler/https" = "vivaldi";
  };
}

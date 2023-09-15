{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.luluyume = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ] ++ ifTheyExist [ "git" ];

    packages = [ pkgs.home-manager ];
  };
}
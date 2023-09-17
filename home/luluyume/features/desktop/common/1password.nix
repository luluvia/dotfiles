{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    unstable._1password-gui 
    unstable._1password 
  ];
}

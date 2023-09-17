{ pkgs, ... }: {
  home.pkgs = with pkgs; [ 
    unstable._1password-gui 
    unstable._1password 
  ];
}
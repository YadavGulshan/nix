{ pkgs, ...}: {

  imports = [
    ./programs
    ./scripts
    ./themes
  ];

  home = {
    username = "gulshan";
    homeDirectory = "/home/gulshan";
  };

  home.packages = (with pkgs; [
    #User Apps
    vscode
    
    #utils
    git
    rustup
    curl

    #misc 
    nano
    wget
    # tokyo-night-gtk
    gedit

    python311Full
    poetry
    jetbrains-toolbox
    pre-commit
  ]) ++ (with pkgs.gnome; [ 
    gnome-tweaks
    gnome-terminal
  ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B-LB";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}

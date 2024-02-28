{ hyprland, pkgs, ...}: {

  imports = [
    hyprland.homeManagerModules.default
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
    celluloid
    bibata-cursors
    vscode
    lollypop
    
    #utils
    git
    rustup
    catimg
    curl
    appimage-run
    pavucontrol
    sqlite

    #misc 
    nano
    rofi
    wget
    btop
    tokyo-night-gtk

    python311Full
    poetry
    jetbrains-toolbox
    pre-commit
  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
    gedit
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

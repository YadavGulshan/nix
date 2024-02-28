{ config, lib, pkgs, ... }:
{
  imports = [
    ./fonts
    ./virtualisation
  ];

  programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        user = "gulshan";
        command = "$SHELL -l";
      };
    };
  };

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
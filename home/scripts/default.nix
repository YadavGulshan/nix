{ config, lib, pkgs, ... }:

let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then 
        killall dynamic_wallpaper
        swww img $(find ~/Imagens/wallpapers/. -name "*.png" | shuf -n1) --transition-type simple
    fi
  '';
  default_wall = pkgs.writeShellScriptBin "default_wall" ''
    if command -v swww >/dev/null 2>&1; then 
          swww img ~/Imagens/wallpapers/menhera.jpg  --transition-type simple
    fi
  '';
in
{
  home.packages = with pkgs; [
    wallpaper_random
    default_wall
  ];
}

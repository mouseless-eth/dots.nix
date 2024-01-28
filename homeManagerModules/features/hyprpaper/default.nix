{ pkgs
, config
, ...
}: {
  home.packages = with pkgs; [
    hyprpaper
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/${config.home.username}/.snowstorm/homeManagerModules/features/hyprpaper/aenami.png
    preload = /home/${config.home.username}/.snowstorm/homeManagerModules/features/hyprpaper/aether_4k.png

    wallpaper = eDP-1,/home/${config.home.username}/.snowstorm/homeManagerModules/features/hyprpaper/aenami.png
    wallpaper = HDMI-A-1,/home/${config.home.username}/.snowstorm/homeManagerModules/features/hyprpaper/aenami.png
    wallpaper = HDMI-A-2,/home/${config.home.username}/.snowstorm/homeManagerModules/features/hyprpaper/aether_4k.png
  '';
}

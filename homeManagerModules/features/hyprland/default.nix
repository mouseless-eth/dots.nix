{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [./hyprlock.nix ./hypridle.nix ./workspace-switcher.nix ./monitors.nix ./binds.nix];

  wayland.windowManager.hyprland = {
    plugins = [
      #inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      # ...
    ];
    enable = true;
    package = pkgs.hyprland;

    settings = {
      layerrule = [
        "ignorezero,waybar"
      ];

      # Some default env vars.
      env = [
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,HyprBibataModernClassicSVG"
        "HYPRCURSOR_SIZE,64"
      ];

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "waybar"
        "dunst"
        "hyprpaper"
        "$HOME/.config/hypr/scripts/workspacer/workspace_listener.sh"
        "hypridle"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        cursor_inactive_timeout = 4;
        "col.active_border" = "rgb(BD93F9) rgb(6272A4) 60deg";
        allow_tearing = false;
      };

      group = {
        groupbar = {
          font_size = 11;
        };
      };

      monitor =
        map
        (
          m: let
            resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
            position = "${toString m.x}x${toString m.y}";
            scale = "${toString m.scale}";
            transform = "${toString m.transform}";
          in "${m.name}, ${resolution}, ${position}, ${scale}, transform, ${transform}"
        )
        (config.myHomeManager.monitors);

      workspace =
        map
        (
          m: "${m.name},${m.workspace}"
        )
        (lib.filter (m: m.workspace != null) config.myHomeManager.monitors);

      decoration = {
        #active_opacity = 0.98;
        #inactive_opacity = 0.95;
        #fullscreen_opacity = 1;
        rounding = 5;
        blur = {
          enabled = true;
          size = 5;
          passes = 6;
          new_optimizations = true;
          ignore_opacity = false;
        };
        drop_shadow = false;
        #shadow_range = 12;
        #shadow_offset = "3 3";
      };

      misc = {
        disable_hyprland_logo = true;
      };

      binds = {
        movefocus_cycles_fullscreen = true;
      };

      windowrulev2 = [
        "bordercolor rgb(FF5555),fullscreen:1"
        #"opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        #"noanim,class:^(xwaylandvideobridge)$"
        #"nofocus,class:^(xwaylandvideobridge)$"
        #"noinitialfocus,class:^(xwaylandvideobridge)$"
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
      ];

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
      };

      master = {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = "true";
        mfact = "0.5";
      };

      animations = {
        enabled = true;

        bezier = "defaultBezier, 0.05, 0.9, 0.1, 1.05";

        #  animation = [
        #    "windowsIn, 2, 5, easeinout, slide" # Slower, smoother
        #    "windowsOut, 2, 5, easeinout, slide" # Slower, smoother
        #    "windowsMove, 2, 5, easeinout" # Slower, smoother
        #    "workspaces, 2, 4, easeinout, slide" # Increased duration for smoothness
        #    "fadeIn, 2, 5, easein" # Slower fade in
        #    "fadeOut, 2, 5, easeout" # Slower fade out
        #    "fadeSwitch, 2, 5, easeinout" # Smooth transition
        #    "fadeShadow, 2, 5, easeinout" # Smooth shadow effect
        #    "fadeDim, 2, 5, easeinout" # Smooth dimming
        #    "border, 2, 5, easeoutback" # Retaining some dynamic effect
        #  ];
        #};
      };
    };
  };
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard

    swww

    networkmanagerapplet

    rofi-wayland
    wofi

    xwaylandvideobridge

    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
  ];
}

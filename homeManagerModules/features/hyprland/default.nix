{ pkgs
, config
, lib
, inputs
, ...
}: {
  imports = [ ./monitors.nix ./binds.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    settings = {
      layerrule = [
        "ignorezero,waybar"
      ];

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "waybar"
        "dunst"
        "hyprpaper"
      ];

      general = {
        gaps_in = 15;
        gaps_out = 20;
        border_size = 1;
        cursor_inactive_timeout = 4;
        "col.active_border" = "rgb(BD93F9) rgb(6272A4) 60deg";
      };

      group = {
        groupbar = {
          font_size = 11;
        };
      };

      monitor =
        map
          (
            m:
            let
              resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
              position = "${toString m.x}x${toString m.y}";
              scale = "${toString m.scale}";
              transform = "${toString m.transform}";
            in
            "${m.name}, ${resolution}, ${position}, ${scale}, transform, ${transform}"
          )
          (config.myHomeManager.monitors);

      workspace =
        map
          (
            m: "${m.name},${m.workspace}"
          )
          (lib.filter (m: m.workspace != null) config.myHomeManager.monitors);

      decoration = {
        active_opacity = 1;
        inactive_opacity = 1;
        fullscreen_opacity = 1;
        rounding = 5;
        blur = {
          enabled = true;
          size = 5;
          passes = 1;
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
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "nofocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
      ];
      #animations = {
      #  enabled = true;
      #  bezier = [
      #    "easein, 0.25, 0, 0.75, 0" # More gradual start
      #    "easeout, 0.75, 1, 0.25, 1" # More gradual end
      #    "easeinout, 0.42, 0, 0.58, 1" # Smooth start and end
      #    "easeoutback, 0.34, 1.56, 0.64, 1" # Retaining one of your original curves for variety
      #  ];

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
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
  ];
}

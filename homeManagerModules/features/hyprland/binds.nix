{
  inputs,
  pkgs,
  ...
}: let
  mod = "SUPER";
  modShift = "SUPER_SHIFT";

  pactl = "${pkgs.pulseaudio}/bin/pactl";
in {
  wayland.windowManager.hyprland.settings = {
    # Remap capslock to super.
    input = {
      kb_layout = "us";
      kb_options = "caps:super,ctrl:shift";
    };

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];

    bind = [
      # Exec commands.
      "${mod}, return, exec, kitty"
      # TODO: save to screenshots folder
      "${modShift}, p, exec, grimblast copy area"
      "${mod}, d, exec, $HOME/.config/rofi/launchers/type-2/launcher.sh"

      # Brightness control (only works if the system has lightd)
      ",F5,exec,light -U 5"
      ",F6,exec,light -A 5"

      # Volume
      ",F3,exec,${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
      ",F2,exec,${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
      ",F1,exec,${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
      "SHIFT,F1,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
      ",F4,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"

      # Misc.
      "${modShift}, e, exit"
      #"${mod}, W, hyprexpo:expo, toggle"

      # workspacer
      "${mod}, Y, exec , $HOME/.config/hypr/scripts/workspacer/workspaced.py"
      "${mod}, V, togglefloating,"
      "${mod}, R, exec, $menu"
      "${mod}, P, pseudo,"
      "${mod}, T, togglesplit,"

      # Window management.
      "${mod}, f, fullscreen, 1"
      "${modShift}, q, killactive"

      "${modShift}, H, movewindow, l"
      "${modShift}, J, movewindow, d"
      "${modShift}, K, movewindow, u"
      "${modShift}, L, movewindow, r"

      "${mod}, right, resizeactive, 50 0"
      "${mod}, left, resizeactive, -50 0"
      "${mod}, up, resizeactive, 0 -50"
      "${mod}, down, resizeactive, 0 50"

      # Movement.
      "${mod}, H, movefocus, l"
      "${mod}, J, movefocus, d"
      "${mod}, k, movefocus, u"
      "${mod}, L, movefocus, r"

      # Workspace Management.
      "${mod}, 1, workspace, 1"
      "${mod}, 2, workspace, 2"
      "${mod}, 3, workspace, 3"
      "${mod}, 4, workspace, 4"
      "${mod}, 5, workspace, 5"
      "${mod}, 6, workspace, 6"
      "${mod}, 7, workspace, 7"
      "${mod}, 8, workspace, 8"
      "${mod}, 9, workspace, 9"
      "${mod}, 0, workspace, 10"

      "${modShift}, 1, movetoworkspacesilent, 1"
      "${modShift}, 2, movetoworkspacesilent, 2"
      "${modShift}, 3, movetoworkspacesilent, 3"
      "${modShift}, 4, movetoworkspacesilent, 4"
      "${modShift}, 5, movetoworkspacesilent, 5"
      "${modShift}, 6, movetoworkspacesilent, 6"
      "${modShift}, 7, movetoworkspacesilent, 7"
      "${modShift}, 8, movetoworkspacesilent, 8"
      "${modShift}, 9, movetoworkspacesilent, 9"
      "${modShift}, 0, movetoworkspacesilent, 10"

      # misc
      "${modShift}, X, exec, hyprlock"
      "${mod}, S, togglespecialworkspace, magic"
      "${modShift}, S, movetoworkspace, special:magic"
    ];
  };
}

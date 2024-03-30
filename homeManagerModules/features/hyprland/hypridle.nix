{ pkgs
, inputs
, ...
}: {
  imports = [
    inputs.hypridle.homeManagerModules.hypridle
  ];
  services.hypridle = {
    enable = true;
    lockCmd = "hyprlock";
    beforeSleepCmd = "hyprlock";
    listeners = [
      {
        timeout = 300;
        onTimeout = "hyprlock";
      }
      {
        timeout = 305;
        onTimeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
        onResume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      }
    ];
  };
}
